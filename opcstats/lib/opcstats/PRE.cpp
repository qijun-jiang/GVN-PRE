//PRE test gitignore
//#define DEBUG_TYPE "gvn"
#include "llvm/Transforms/Scalar.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/ADT/Hashing.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/ConstantFolding.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Analysis/InstructionSimplify.h"
#include "llvm/Analysis/Loads.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"
#include "llvm/Analysis/PHITransAddr.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/Analysis/DominanceFrontier.h"
#include "llvm/Assembly/Writer.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/Support/PatternMatch.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/SSAUpdater.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Pass.h"
#include "llvm/Support/CFG.h"

#include <vector>
#include <map>
#include <set>
#include <limits>
#include <deque>
#include <queue>

using namespace std;
using namespace llvm;
using namespace PatternMatch;

namespace {
  const double biasPercentage = 0.8;
  const int MAX=20010;  
  const int INF=1<<30;  
  struct edge{int to,cap,rev;};
  struct mcpre: public FunctionPass {
    static char ID;
    ProfileInfo* PI;
    Function *Func;
    Instruction *current_exp;

    // Block information - Map basic blocks in a function back and forth to
    // unsigned integers.
    std::vector<BasicBlock*> BlockMapping;
    map<BasicBlock*, unsigned> BlockNumbering;
    deque<BasicBlock*> split_queue;

    // ProcessedExpressions - Keep track of which expressions have already been
    // processed.
    set<Instruction*> ProcessedExpressions;
    set<Instruction*> TargetExpressions;
    
    // block attributes
    std::vector<bool> COMP;
    std::vector<bool> TRANSP;
    std::vector<bool> NAVAL, XAVAL;
    std::vector<bool> NPANT, XPANT;
    
    // graph
    int virtual_source, virtual_sink;
    vector< map<int, double> > reduced_graph;
    
    // min-cut
    vector< pair<int, int> > cut_edges;
    
    vector<edge> G[MAX];  
    int level[MAX];  
    int iter[MAX];
    void add(int from,int to,int cap)  
    {  
        int toedge, revedge;
        toedge = G[to].size();
        G[from].push_back((edge){to,cap,toedge});
        revedge = G[from].size()-1;
        G[to].push_back((edge){from,0,revedge});  
    }  
    void bfs(int s)  
    {  
        memset(level,-1,sizeof(level)); 
        queue<int> que;  
        level[s]=0;  
        que.push(s);  
        while(!que.empty())  
        {  
            int v=que.front();  
            que.pop();  
            for(int i=0;i<G[v].size();i++)  
            {  
                edge &e=G[v][i];  
                if(e.cap>0&& level[e.to]<0)  
                {  
                    level[e.to]=level[v]+1;  
                    que.push(e.to);  
                }  
            }  
        }  
    }  
    int dfs(int v,int t,int f)  
    {  
        if(v==t) return f;  
        for(int &i=iter[v];i<G[v].size();i++)  
        {  
            edge &e=G[v][i];  
            if(e.cap>0&&level[v]<level[e.to])  
            {  
                int d=dfs(e.to,t,min(f,e.cap));  
                if(d>0)  
                {  
                    e.cap-=d;  
                    G[e.to][e.rev].cap+=d;  
                    return d;  
                }  
            }  
        }  
        return 0;  
    }  
    
    mcpre() : FunctionPass(ID) { }
    virtual bool runOnFunction(Function &F);
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<ProfileInfo>();
      AU.addRequired<DominatorTree>();
    }
    
    bool ProcessExpression(Instruction *Expr);
    void splitOnModiOrComp(BasicBlock *N);
    void initClear();
    void part1();
    void part2();
    void part3();
    void part4();
    void runForwardAnalysis(ReversePostOrderTraversal<Function*> &RPOT);
    void runBackwardAnalysis(ReversePostOrderTraversal<Function*> &RPOT, unsigned FSize);
    bool checkEqual(vector<bool> prev, vector<bool> curr);
    char checkBBType(BasicBlock *B, Instruction *Expr);
    bool checkModification(BasicBlock *B, Instruction *Expr);
    bool checkComputation(Instruction *I, Instruction *Expr);
    bool checkModifyOprand(Instruction *I, Instruction *Expr);
  };
}

bool mcpre::runOnFunction(Function &F) {
  // It's a pointer
  Func = &F;
  PI = &getAnalysis<ProfileInfo>();
  errs() <<"kaka\n";
  
  // filter target expressions
  for (Function::iterator b = F.begin(); b != F.end(); b++) {
    for (BasicBlock::iterator i = b->begin(); i != b->end(); i++) {
      if (i->getOpcode() == Instruction::Add
         || i->getOpcode() == Instruction::Mul) {
         // filter add, multi first
         // TODO: filter sub, div
         TargetExpressions.insert(&(*i));
      }
    }
  }
  
  // run mc-pre on target expressions
  for (auto e=TargetExpressions.begin(); e!=TargetExpressions.end(); e++){
    ProcessExpression(*e);
  }
  
  return true;
}

bool mcpre::ProcessExpression(Instruction *Expr) {
  current_exp = Expr;
  for (Function::iterator b = Func->begin(); b != Func->end(); b++) {
    split_queue.push_back(b);
  }
  while (!split_queue.empty()) {
    splitOnModiOrComp(split_queue.front());
  }
  initClear();
  part1();
  part2();
  part3();
  part4();
 
  return true;
}

// recursively checking through the dom tree
void mcpre::splitOnModiOrComp(BasicBlock *BB) {
  split_queue.pop_front();
  map<BasicBlock *, int> edge_to_child;
  errs() << "Basic block (name=" << BB->getName() << ") has "
             << BB->size() << " instructions.\n";
  int split_flag = -1;
  // filter target expressions
  for (BasicBlock::iterator I = BB->begin(); I != BB->end(); I++) {
    // use break after split to jump!
    int new_flag;
    if (checkComputation(I, current_exp)) {
      new_flag = 1;
    } else if (checkModifyOprand(I, current_exp)) {
      new_flag = 2;
    } else {
      continue;
    }
    
    if (split_flag == -1) {
      split_flag = new_flag;
      continue;
    }

    // both modi and comp, split
    if (split_flag != new_flag) {
      errs()<<"split:"<< BB->getName() <<" at "<< *I <<'\n';
      // store child edge weight
      for (succ_iterator SI = succ_begin(BB), Ed = succ_end(BB); SI != Ed; ++SI) {
        BasicBlock *child = *SI;
        ProfileInfo::Edge E = PI->getEdge(BB, child);
        edge_to_child[child] = PI->getEdgeWeight(E);
        errs()<< E <<":"<< edge_to_child[child]<<'\n';
      }
      errs()<<"restore: and has exc count" << (int)PI->getExecutionCount(BB) <<'\n';
      
      // split
      BasicBlock *RestBB = SplitBlock(BB, I, this);
      split_queue.push_front(RestBB);
      
      // set edge to rest block
      ProfileInfo::Edge E = PI->getEdge(BB, RestBB);
      PI->setEdgeWeight(E, PI->getExecutionCount(BB));
      
      // restore child edge
      BB = RestBB;
      for (succ_iterator SI = succ_begin(BB), Ed = succ_end(BB); SI != Ed; ++SI) {
        BasicBlock *child = *SI;
        ProfileInfo::Edge E = PI->getEdge(BB, child);
        PI->setEdgeWeight(E, edge_to_child[child]);
        errs()<< E <<":"<< edge_to_child[child]<<'\n';
      }
      errs()<<'\n';
      break;
    }
  }
}

void mcpre::initClear() {
  // clear block mapping
  BlockMapping.clear();
  BlockNumbering.clear();
    
  // clear block attributes
  COMP.clear();
  TRANSP.clear();
  NAVAL.clear();
  XAVAL.clear();
  NPANT.clear();
  XPANT.clear();
}

void mcpre::part1() {
 
  // BlockMapping
  ReversePostOrderTraversal<Function*> RPOT(Func);
  int count = 0;
  for (ReversePostOrderTraversal<Function*>::rpo_iterator I = RPOT.begin(); I != RPOT.end(); I++) {
    BasicBlock *BB = *I;
    BlockNumbering[BB] = BlockMapping.size();
    BlockMapping.push_back(BB);
    errs() << "BlockMapping BB " << count++ << ", " << BB->getName() << "\n";
  }
  
  // init block attributes
  int FSize = Func->size();
  COMP.resize(FSize, false);
  TRANSP.resize(FSize, false);
  NAVAL.resize(FSize, true);
  XAVAL.resize(FSize, true);
  NPANT.resize(FSize, false);
  XPANT.resize(FSize, false);
  
  // update COMP and TRANSP
  int id = 0;
  for (ReversePostOrderTraversal<Function*>::rpo_iterator I = RPOT.begin(); I != RPOT.end(); I++, id++) {
    BasicBlock *BB = *I;
    switch (checkBBType(BB, current_exp)) {
      case 'C':
        COMP[id] = true;
        break;
      case 'T':
        TRANSP[id] = true;
        break;
    }
  }
  
  // run forward and backward analysis
  runForwardAnalysis(RPOT);
  runBackwardAnalysis(RPOT, FSize);
}
void mcpre::part2() {
  // remove nonessential edges and nonessential nodes
  // and construct a single-source single-sink graph
  
  int n = BlockMapping.size();
  reduced_graph.resize(n+2);
  
  for (int i = 0; i < n+2; ++i) {
    reduced_graph[i].clear();
  }
  
  vector<int> indegree;
  vector<int> outdegree;
  indegree.resize(n, 0);
  outdegree.resize(n, 0);
  
  for (int u = 0; u < n; ++u) {
    BasicBlock* pred = BlockMapping[u];
    
    for (succ_iterator SI = succ_begin(pred), E = succ_end(pred); SI != E; ++SI) {
      BasicBlock* succ = *SI;
      int v = BlockNumbering[succ];
      // ignore nonessential edges by checking partial availablity at the exit of nodes
      // and partial anticipability at the entry of nodes.
      // if x-aval[u] is true, then edge (u, v) is an insertion-redundant edge
      // if n-pant[v] is false, then edge (u, v) is an insertion-useless edge
      // otherwise, the edge is an essential edge.
      if (XAVAL[u]) {
        continue;
      } else if (!NPANT[v]) {
        continue;
      } else {
        ProfileInfo::Edge e = ProfileInfo::getEdge(pred, succ);
        double w = PI->getEdgeWeight(e);
        reduced_graph[u][v] = w;
        outdegree[u]++;
        indegree[v]++;
      }
    }
    
  }
  
  vector<int> entryNodes;
  vector<int> exitNodes;
  
  // group all entry nodes to a virtual source node and 
  // all the exit nodes to a virtual sink node.
  for (int i = 0; i < n; ++i) {
    if (indegree[i] == 0 && outdegree[i] != 0) {
      entryNodes.push_back(i);
    } else if (outdegree[i] == 0 && indegree[i] != 0) {
      exitNodes.push_back(i);
    }
  }
  
  virtual_source = n;
  virtual_sink = n+1;
  
  for (auto id : entryNodes) {
    reduced_graph[virtual_source][id] = numeric_limits<int>::max() - 1;
  }
  
  for (auto id : exitNodes) {
    reduced_graph[id][virtual_sink] = numeric_limits<int>::max() - 1;
  }
  
}

void mcpre::part3() {
  for (int i = 0; i <= virtual_sink; i++){
    G[i].clear();
  }
  for (int i = 0; i <= virtual_sink; i++){
    errs() << "node"<< i << "has" << reduced_graph[i].size() << " edges\n";
    for (auto it = reduced_graph[i].begin(); it != reduced_graph[i].end(); it++) {
      int to = (*it).first;
      int cap = (*it).second;
      errs() << "edge: "<< i << " to "<< to <<" "<<cap<<"\n";
      add(i, to, cap);
    }
  }

  // run max-flow
  int flow=0;  
  while(1)
  {  
    bfs(virtual_source);  
    errs() << "virtual_sink level = " << level[virtual_sink] << "\n";
    if(level[virtual_sink]<0) break;  
    memset(iter,0,sizeof(iter));  
    int f;  
    while((f=dfs(virtual_source,virtual_sink,INF))>0)  
        flow+=f;  
  }  
  errs() << "max flow = " << flow << "\n";
  
  // find min cut
  cut_edges.clear();
  for (int i = 0; i <= virtual_sink; i++){
    if (level[i] < 0) {
      continue;
    }
    for (auto it = reduced_graph[i].begin(); it != reduced_graph[i].end(); it++) {
      int to = (*it).first;
      int cap = (*it).second;
      if (level[to] == -1) {
        cut_edges.push_back(std::make_pair (i, to));
        errs()<< "cut_edges.add: "<<i<<','<< to<<"\n";
      }
    }
  }
}
void mcpre::part4() {

  if (cut_edges.empty())
     return;
  
  AllocaInst *StackVar = new AllocaInst(current_exp->getType(), "stackVar", Func->begin()->getFirstInsertionPt());
  vector<Instruction* > COMPInsts;
  Instruction* Expr = current_exp->clone();
  int remaining_cuts = cut_edges.size();

  for (int i = 0; i < COMP.size(); i++) {
    if (!COMP[i]) continue;
    for (auto iter = BlockMapping[i]->begin(); iter != BlockMapping[i]->end(); iter++) 
      if (checkComputation(iter, current_exp)) {
        COMPInsts.push_back(iter);
      }
  }
  
  // replace operand
  for (int i = 0; i < COMPInsts.size(); i++) {
    Instruction *I = COMPInsts[i];
    for (Instruction::use_iterator U = I->use_begin(), E = I->use_end(); U != E; ++U) {
      if (Instruction *Use = dyn_cast<Instruction>(*U)) {
        int count = 0;
        LoadInst *LoadStVar = new LoadInst(StackVar, "LoadStackVar");      
        for (auto OI = Use->op_begin(), OE = Use->op_end(); OI != OE; ++OI) {
          Instruction *temp = dyn_cast<Instruction>(OI);
          if (temp == I) {
            if (count == 0) {
              LoadStVar->insertBefore(Use);
              count = 1;
            }
            //*OI = (Value*)(StackVar);
            Use->replaceUsesOfWith(temp, LoadStVar);
          }
        }
      }
    }
    I->eraseFromParent();
  }
  
  for (auto iter = cut_edges.begin(); iter != cut_edges.end(); iter++) {
    double theWeight = PI->getEdgeWeight(PI->getEdge(BlockMapping[iter->first], BlockMapping[iter->second]));
    
    errs() << "split the edge: " << iter->first << "->" << iter->second << " with weight " << theWeight << "\n";
    // split edge
    BasicBlock *newBB = SplitEdge(BlockMapping[iter->first], BlockMapping[iter->second], this);
    if (newBB->getSinglePredecessor() == BlockMapping[iter->second])
      newBB = BlockMapping[iter->second];
    
    Instruction *newInst;
    if (remaining_cuts > 1)
      newInst = Expr->clone();
    else
      newInst = Expr;

    errs() << "insert new Instruction: " << *newInst << "before: " << *(newBB->begin()) << "\n";
    newInst->insertBefore(newBB->getTerminator());
    StoreInst *StoreStVar = new StoreInst(newInst, StackVar);
    StoreStVar->insertBefore(newBB->getTerminator());
    
    /*errs() << "********************\n";
    errs() << *BlockMapping[iter->first] << "\n";
    errs() << "Weight = " << PI->getEdgeWeight(PI->getEdge(BlockMapping[iter->first], BlockMapping[iter->second])) << "\n";
    errs() << *BlockMapping[iter->second] << "\n";
    errs() << "Weight = " << PI->getEdgeWeight(PI->getEdge(BlockMapping[iter->second], *succ_begin(BlockMapping[iter->second]))) << "\n";
    errs() << *(*succ_begin(BlockMapping[iter->second])) << "\n";
    errs() << "********************\n";*/
    
    // set edge weight 
    PI->setEdgeWeight(PI->getEdge(BlockMapping[iter->first], newBB), theWeight);
    PI->setEdgeWeight(PI->getEdge(newBB, *succ_begin(newBB)), theWeight);
    
    /*errs() << "********************\n";
    errs() << *BlockMapping[iter->first] << "\n";
    errs() << "Weight = " << PI->getEdgeWeight(PI->getEdge(BlockMapping[iter->first], BlockMapping[iter->second])) << "\n";
    errs() << *BlockMapping[iter->second] << "\n";
    errs() << "Weight = " << PI->getEdgeWeight(PI->getEdge(BlockMapping[iter->second], *succ_begin(BlockMapping[iter->second]))) << "\n";
    errs() << *(*succ_begin(BlockMapping[iter->second])) << "\n";
    errs() << "********************\n";*/
  }
  
}


void mcpre::runForwardAnalysis(ReversePostOrderTraversal<Function*> &RPOT) {
  int loopCount = 0;
  while (++loopCount) {
    errs() << "Forward loop " << loopCount << ":\n";
    
    vector<bool> prevNAVAL = NAVAL;
    vector<bool> prevXAVAL = XAVAL;
    NAVAL[0] = false;
    XAVAL[0] = false;
    for (ReversePostOrderTraversal<Function*>::rpo_iterator I = RPOT.begin() + 1; I != RPOT.end(); I++) {
      BasicBlock *BB = *I;
      unsigned id = BlockNumbering[BB];
      for (pred_iterator PI = pred_begin(BB); PI != pred_end(BB); PI++) {
        NAVAL[id] = NAVAL[id] & XAVAL[BlockNumbering[*PI]];
      }
      XAVAL[id] = COMP[id] | (NAVAL[id] & TRANSP[id]);
    }
    
//     for (unsigned i = 0; i < prevNAVAL.size(); i++) {
//       errs() << i << " prev: "  << prevNAVAL[i] << " " << prevXAVAL[i] << "\n";
//       errs() << i << " now: "  << NAVAL[i] << " " << XAVAL[i] << "\n";
//     }
    
    if (checkEqual(prevNAVAL, NAVAL) && checkEqual(prevXAVAL, XAVAL)) {
      errs() << "Forward SUCCESS\n";
      break;
    }
  }
}

void mcpre::runBackwardAnalysis(ReversePostOrderTraversal<Function*> &RPOT, unsigned FSize) {
  int loopCount = 0;
  while (++loopCount) {
    errs() << "Backward loop " << loopCount << ":\n";
    
    vector<bool> prevNPANT = NPANT;
    vector<bool> prevXPANT = XPANT;
    XPANT[FSize-1] = false;
    NPANT[FSize-1] = false;
    
    ReversePostOrderTraversal<Function*>::rpo_iterator I = RPOT.end() - 2;
    for (int i = FSize-2; i >= 0; I--, i--) {
      BasicBlock *BB = *I;
      unsigned id = BlockNumbering[BB];
      for (succ_iterator PI = succ_begin(BB); PI != succ_end(BB); PI++) {
        XPANT[id] = XPANT[id] | NPANT[BlockNumbering[*PI]];
      }
      NPANT[id] = COMP[id] | (XPANT[id] & TRANSP[id]);
    }
    
    if (checkEqual(prevNPANT, NPANT) && checkEqual(prevXPANT, XPANT)) {
      errs() << "Backward SUCCESS\n";
      break;
    }
  }
}

bool mcpre::checkEqual(vector<bool> prev, vector<bool> curr) {
  for (unsigned i = 0; i < prev.size(); i++) {
    if (prev[i] != curr[i]) {
      return false;
    }
  }
  return true;
}

char mcpre::checkBBType(BasicBlock *B, Instruction *Expr) {
  if (checkModification(B, Expr)) return 'M';  
  for (BasicBlock::iterator i = B->begin(); i != B->end(); i++) {
    if (checkComputation(i, Expr)) return 'C';
  }
  return 'T';
}

bool mcpre::checkComputation(Instruction *I, Instruction *Expr) {
  if (I->getNumOperands() != 2) return false;
  if (I->getOpcode() != Expr->getOpcode()) return false;
  
  Instruction *ExprOp1 = dyn_cast<Instruction>(Expr->getOperand(0));
  Instruction *ExprOp2 = dyn_cast<Instruction>(Expr->getOperand(1));
  Instruction *op1 = dyn_cast<Instruction>(I->getOperand(0));
  Instruction *op2 = dyn_cast<Instruction>(I->getOperand(1));
  
  if (ExprOp1 == op1 && ExprOp2 == op2) return true;
  if (ExprOp1 == op2 && ExprOp2 == op1) return true;
  
  return false; 
}

bool mcpre::checkModification(BasicBlock *B, Instruction *Expr) {
  for (unsigned i = 0; i != Expr->getNumOperands(); i++) {
    if (Instruction *I = dyn_cast<Instruction>(Expr->getOperand(i))) {
      if (I->getParent() == B)  // Operand is defined in this block!
        return true;
    }
  }
  return false;
}
     
bool mcpre::checkModifyOprand(Instruction *I, Instruction *Expr) {
  for (unsigned i = 0; i != Expr->getNumOperands(); i++) {
    if (Instruction *oprand = dyn_cast<Instruction>(Expr->getOperand(i))) {
      if (oprand == I)
        return true;
    }
  }
  return false;
}
        
char mcpre::ID = 0;
static RegisterPass<mcpre> X("mcpre", "min-cut pre", false, false);






