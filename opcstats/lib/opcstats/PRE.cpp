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

using namespace std;
using namespace llvm;
using namespace PatternMatch;

namespace {
  const double biasPercentage = 0.8;
  struct mcpre: public FunctionPass {
    static char ID;
    ProfileInfo* PI;
    Function *Func;
    Instruction *current_exp;

    // Block information - Map basic blocks in a function back and forth to
    // unsigned integers.
    std::vector<BasicBlock*> BlockMapping;
    map<BasicBlock*, unsigned> BlockNumbering;

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
    
    mcpre() : FunctionPass(ID) { }
    virtual bool runOnFunction(Function &F);
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<ProfileInfo>();
      AU.addRequired<DominatorTree>();
    }
    
    bool ProcessExpression(Instruction *Expr);
    void splitOnModiOrComp(DomTreeNode *N);
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
  DominatorTree& DT = getAnalysis<DominatorTree>();
  splitOnModiOrComp(DT.getRootNode());
  initClear();
  part1();
  part2();
  part3();
  part4();
  return true;
}

// recursively checking through the dom tree
void mcpre::splitOnModiOrComp(DomTreeNode *N) {
  map<BasicBlock *, int> edge_to_child;
  assert(N != 0 && "Null dominator tree node?");
  BasicBlock *BB = N->getBlock();
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
      const std::vector<DomTreeNode*> &Children = N->getChildren();
      errs()<< "has "<< Children.size()<<" children\n";
      for (unsigned k = 0, e = Children.size(); k != e; ++k) {
        BasicBlock *child = Children[k]->getBlock();
        ProfileInfo::Edge E = PI->getEdge(BB, child);
        edge_to_child[child] = PI->getEdgeWeight(E);
        errs()<< E <<":"<< edge_to_child[child]<<'\n';
      }
      errs()<<"restore: and has exc count" << (int)PI->getExecutionCount(BB) <<'\n';
      
      // split
      BasicBlock *RestBB = SplitBlock(BB, I, this);
      
      // set edge to rest block
      ProfileInfo::Edge E = PI->getEdge(BB, RestBB);
      PI->setEdgeWeight(E, PI->getExecutionCount(BB));
      
      // restore child edge
      BB = RestBB;
      N = N->getChildren()[0];
      const std::vector<DomTreeNode*> &NewChildren = N->getChildren();
      for (unsigned k = 0, e = NewChildren.size(); k != e; ++k) {
        BasicBlock *child = NewChildren[k]->getBlock();
        ProfileInfo::Edge E = PI->getEdge(BB, child);
        PI->setEdgeWeight(E, edge_to_child[child]);
        errs()<< E <<":"<< edge_to_child[child]<<'\n';
      }
      errs()<<'\n';
      break;
    }
  }
  
  const std::vector<DomTreeNode*> &Children = N->getChildren();
  for (unsigned i = 0, e = Children.size(); i != e; ++i)
    splitOnModiOrComp(Children[i]);
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
    reduced_graph[virtual_source][id] = numeric_limits<double>::max();
  }
  
  for (auto id : exitNodes) {
    reduced_graph[id][virtual_sink] = numeric_limits<double>::max();
  }
  
}

void mcpre::part3() {}
void mcpre::part4() {}


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






