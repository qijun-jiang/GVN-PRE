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

#include <vector>
#include <map>
#include <set>

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
    void part1();
    void part2();
    void part3();
    void part4();
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

void mcpre::part1() {
  // init block attributes
  int FSize = Func->size();
  COMP.resize(FSize, false);
  TRANSP.resize(FSize, false);
  NAVAL.resize(FSize, false);
  XAVAL.resize(FSize, false);
  NPANT.resize(FSize, false);
  XPANT.resize(FSize, false);
}
void mcpre::part2() {}
void mcpre::part3() {}
void mcpre::part4() {}


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






