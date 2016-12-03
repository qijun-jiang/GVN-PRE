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

using namespace llvm;
using namespace PatternMatch;

namespace {
  const double biasPercentage = 0.8;
  struct mcpre: public FunctionPass {
    static char ID;
    ProfileInfo* PI;
    
    // block mapping
    std::vector<BasicBlock*> BlockMapping;
    std::map<BasicBlock*, unsigned> BlockNumbering;
    
    // block attributes
    std::vector<bool> COMP;
    std::vector<bool> TRANSP;
    std::vector<bool> NAVAL, XAVAL;
    std::vector<bool> NPANT, XPANT;
    
    mcpre() : FunctionPass(ID) { }
    virtual bool runOnFunction(Function &F);
    void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<ProfileInfo>();
    }
    
    char checkBBType(BasicBlock *B, Instruction *Expr);
    bool checkModification(BasicBlock *B, Instruction *Expr);
    bool checkComputation(Instruction *I, Instruction *Expr);
  };
}

bool mcpre::runOnFunction(Function &F) {
  PI = &getAnalysis<ProfileInfo>();
  errs() <<"kaka\n";
  
  // BlockMapping
  ReversePostOrderTraversal<Function*> RPOT(&F);
  for (ReversePostOrderTraversal<Function*>::rpo_iterator I = RPOT.begin(); I != RPOT.end(); I++) {
    BasicBlock *BB = *I;
    BlockNumbering[BB] = BlockMapping.size();
    BlockMapping.push_back(BB);
  }
  
  // init block attributes
  COMP.resize(F.size(), false);
  TRANSP.resize(F.size(), false);
  NAVAL.resize(F.size(), false);
  XAVAL.resize(F.size(), false);
  NPANT.resize(F.size(), false);
  XPANT.resize(F.size(), false);
  
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
        
        
char mcpre::ID = 0;
static RegisterPass<mcpre> X("mcpre", "min-cut pre", false, false);






