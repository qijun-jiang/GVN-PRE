#define DEBUG_TYPE "gvn"
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
using namespace llvm;
using namespace PatternMatch;

STATISTIC(NumGVNInstr,  "Number of instructions deleted");
STATISTIC(NumGVNLoad,   "Number of loads deleted");
STATISTIC(NumGVNPRE,    "Number of instructions PRE'd");
STATISTIC(NumGVNBlocks, "Number of blocks merged");
STATISTIC(NumGVNSimpl,  "Number of instructions simplified");
STATISTIC(NumGVNEqProp, "Number of equalities propagated");
STATISTIC(NumPRELoad,   "Number of loads PRE'd");

static cl::opt<bool> EnablePRE("enable-pre",
                               cl::init(true), cl::Hidden);
static cl::opt<bool> EnableLoadPRE("enable-load-pre", cl::init(true));

// Maximum allowed recursion depth.
static cl::opt<uint32_t>
MaxRecurseDepth("max-recurse-depth", cl::Hidden, cl::init(1000), cl::ZeroOrMore,
                cl::desc("Max recurse depth (default = 1000)"));

//===----------------------------------------------------------------------===//
//                         ValueTable Class
//===----------------------------------------------------------------------===//

/// This class holds the mapping between values and value numbers.  It is used
/// as an efficient mechanism to determine the expression-wise equivalence of
/// two values.
namespace {

  Statistic<> NumExprsEliminated("pre", "Number of expressions constantified");
  Statistic<> NumRedundant      ("pre", "Number of redundant exprs eliminated");
  Statistic<> NumInserted       ("pre", "Number of expressions inserted");

  struct Expression {
    uint32_t opcode;
    Type *type;
    SmallVector<uint32_t, 4> varargs;

    Expression(uint32_t o = ~2U) : opcode(o) { }

    bool operator==(const Expression &other) const {
      if (opcode != other.opcode)
        return false;
      if (opcode == ~0U || opcode == ~1U)
        return true;
      if (type != other.type)
        return false;
      if (varargs != other.varargs)
        return false;
      return true;
    }

    friend hash_code hash_value(const Expression &Value) {
      return hash_combine(Value.opcode, Value.type,
                          hash_combine_range(Value.varargs.begin(),
                                             Value.varargs.end()));
    }
  };

  class ValueTable {
    DenseMap<Value*, uint32_t> valueNumbering;
    DenseMap<Expression, uint32_t> expressionNumbering;
    AliasAnalysis *AA;
    MemoryDependenceAnalysis *MD;
    DominatorTree *DT;

    uint32_t nextValueNumber;

    Expression create_expression(Instruction* I);
    Expression create_cmp_expression(unsigned Opcode,
                                     CmpInst::Predicate Predicate,
                                     Value *LHS, Value *RHS);
    Expression create_extractvalue_expression(ExtractValueInst* EI);
    uint32_t lookup_or_add_call(CallInst* C);
  public:
    ValueTable() : nextValueNumber(1) { }
    uint32_t lookup_or_add(Value *V);
    uint32_t lookup(Value *V) const;
    uint32_t lookup_or_add_cmp(unsigned Opcode, CmpInst::Predicate Pred,
                               Value *LHS, Value *RHS);
    void add(Value *V, uint32_t num);
    void clear();
    void erase(Value *v);
    void setAliasAnalysis(AliasAnalysis* A) { AA = A; }
    AliasAnalysis *getAliasAnalysis() const { return AA; }
    void setMemDep(MemoryDependenceAnalysis* M) { MD = M; }
    void setDomTree(DominatorTree* D) { DT = D; }
    uint32_t getNextUnusedValueNumber() { return nextValueNumber; }
    void verifyRemoved(const Value *) const;
  };

  struct PRE : public FunctionPass {
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequiredID(BreakCriticalEdgesID);  // No critical edges for now!
      AU.addRequired<PostDominatorTree>();
      AU.addRequired<PostDominanceFrontier>();
      AU.addRequired<DominatorSet>();
      AU.addRequired<DominatorTree>();
      AU.addRequired<DominanceFrontier>();
      AU.addRequired<ValueNumbering>();
    }
    virtual bool runOnFunction(Function &F);

  private:
    // Block information - Map basic blocks in a function back and forth to
    // unsigned integers.
    std::vector<BasicBlock*> BlockMapping;
    hash_map<BasicBlock*, unsigned> BlockNumbering;

    // ProcessedExpressions - Keep track of which expressions have already been
    // processed.
    hash_set<Instruction*> ProcessedExpressions;

    // Provide access to the various analyses used...
    DominatorSet      *DS;
    DominatorTree     *DT; PostDominatorTree *PDT;
    DominanceFrontier *DF; PostDominanceFrontier *PDF;
    //ValueNumbering    *VN;

    // AvailableBlocks - Contain a mapping of blocks with available expression
    // values to the expression value itself.  This can be used as an efficient
    // way to find out if the expression is available in the block, and if so,
    // which version to use.  This map is only used while processing a single
    // expression.
    //
    typedef hash_map<BasicBlock*, Instruction*> AvailableBlocksTy;
    AvailableBlocksTy AvailableBlocks;

    bool ProcessBlock(BasicBlock *BB);
    
    // Anticipatibility calculation...
    void MarkPostDominatingBlocksAnticipatible(PostDominatorTree::Node *N,
                                               std::vector<char> &AntBlocks,
                                               Instruction *Occurrence);
    void CalculateAnticipatiblityForOccurrence(unsigned BlockNo,
                                              std::vector<char> &AntBlocks,
                                              Instruction *Occurrence);
    void CalculateAnticipatibleBlocks(const std::map<unsigned, Instruction*> &D,
                                      std::vector<char> &AnticipatibleBlocks);

    // PRE for an expression
    void MarkOccurrenceAvailableInAllDominatedBlocks(Instruction *Occurrence,
                                                     BasicBlock *StartBlock);
    void ReplaceDominatedAvailableOccurrencesWith(Instruction *NewOcc,
                                                  DominatorTree::Node *N);
    bool ProcessExpression(Instruction *I);
  };

  RegisterOpt<PRE> Z("pre", "Partial Redundancy Elimination");
}

namespace llvm {
template <> struct DenseMapInfo<Expression> {
  static inline Expression getEmptyKey() {
    return ~0U;
  }

  static inline Expression getTombstoneKey() {
    return ~1U;
  }

  static unsigned getHashValue(const Expression e) {
    using llvm::hash_value;
    return static_cast<unsigned>(hash_value(e));
  }
  static bool isEqual(const Expression &LHS, const Expression &RHS) {
    return LHS == RHS;
  }
};

}

//===----------------------------------------------------------------------===//
//                     ValueTable Internal Functions
//===----------------------------------------------------------------------===//

Expression ValueTable::create_expression(Instruction *I) {
  Expression e;
  e.type = I->getType();
  e.opcode = I->getOpcode();
  for (Instruction::op_iterator OI = I->op_begin(), OE = I->op_end();
       OI != OE; ++OI)
    e.varargs.push_back(lookup_or_add(*OI));
  if (I->isCommutative()) {
    // Ensure that commutative instructions that only differ by a permutation
    // of their operands get the same value number by sorting the operand value
    // numbers.  Since all commutative instructions have two operands it is more
    // efficient to sort by hand rather than using, say, std::sort.
    assert(I->getNumOperands() == 2 && "Unsupported commutative instruction!");
    if (e.varargs[0] > e.varargs[1])
      std::swap(e.varargs[0], e.varargs[1]);
  }

  if (CmpInst *C = dyn_cast<CmpInst>(I)) {
    // Sort the operand value numbers so x<y and y>x get the same value number.
    CmpInst::Predicate Predicate = C->getPredicate();
    if (e.varargs[0] > e.varargs[1]) {
      std::swap(e.varargs[0], e.varargs[1]);
      Predicate = CmpInst::getSwappedPredicate(Predicate);
    }
    e.opcode = (C->getOpcode() << 8) | Predicate;
  } else if (InsertValueInst *E = dyn_cast<InsertValueInst>(I)) {
    for (InsertValueInst::idx_iterator II = E->idx_begin(), IE = E->idx_end();
         II != IE; ++II)
      e.varargs.push_back(*II);
  }

  return e;
}

Expression ValueTable::create_cmp_expression(unsigned Opcode,
                                             CmpInst::Predicate Predicate,
                                             Value *LHS, Value *RHS) {
  assert((Opcode == Instruction::ICmp || Opcode == Instruction::FCmp) &&
         "Not a comparison!");
  Expression e;
  e.type = CmpInst::makeCmpResultType(LHS->getType());
  e.varargs.push_back(lookup_or_add(LHS));
  e.varargs.push_back(lookup_or_add(RHS));

  // Sort the operand value numbers so x<y and y>x get the same value number.
  if (e.varargs[0] > e.varargs[1]) {
    std::swap(e.varargs[0], e.varargs[1]);
    Predicate = CmpInst::getSwappedPredicate(Predicate);
  }
  e.opcode = (Opcode << 8) | Predicate;
  return e;
}

Expression ValueTable::create_extractvalue_expression(ExtractValueInst *EI) {
  assert(EI != 0 && "Not an ExtractValueInst?");
  Expression e;
  e.type = EI->getType();
  e.opcode = 0;

  IntrinsicInst *I = dyn_cast<IntrinsicInst>(EI->getAggregateOperand());
  if (I != 0 && EI->getNumIndices() == 1 && *EI->idx_begin() == 0 ) {
    // EI might be an extract from one of our recognised intrinsics. If it
    // is we'll synthesize a semantically equivalent expression instead on
    // an extract value expression.
    switch (I->getIntrinsicID()) {
      case Intrinsic::sadd_with_overflow:
      case Intrinsic::uadd_with_overflow:
        e.opcode = Instruction::Add;
        break;
      case Intrinsic::ssub_with_overflow:
      case Intrinsic::usub_with_overflow:
        e.opcode = Instruction::Sub;
        break;
      case Intrinsic::smul_with_overflow:
      case Intrinsic::umul_with_overflow:
        e.opcode = Instruction::Mul;
        break;
      default:
        break;
    }

    if (e.opcode != 0) {
      // Intrinsic recognized. Grab its args to finish building the expression.
      assert(I->getNumArgOperands() == 2 &&
             "Expect two args for recognised intrinsics.");
      e.varargs.push_back(lookup_or_add(I->getArgOperand(0)));
      e.varargs.push_back(lookup_or_add(I->getArgOperand(1)));
      return e;
    }
  }

  // Not a recognised intrinsic. Fall back to producing an extract value
  // expression.
  e.opcode = EI->getOpcode();
  for (Instruction::op_iterator OI = EI->op_begin(), OE = EI->op_end();
       OI != OE; ++OI)
    e.varargs.push_back(lookup_or_add(*OI));

  for (ExtractValueInst::idx_iterator II = EI->idx_begin(), IE = EI->idx_end();
         II != IE; ++II)
    e.varargs.push_back(*II);

  return e;
}

//===----------------------------------------------------------------------===//
//                     ValueTable External Functions
//===----------------------------------------------------------------------===//

/// add - Insert a value into the table with a specified value number.
void ValueTable::add(Value *V, uint32_t num) {
  valueNumbering.insert(std::make_pair(V, num));
}

uint32_t ValueTable::lookup_or_add_call(CallInst *C) {
  if (AA->doesNotAccessMemory(C)) {
    Expression exp = create_expression(C);
    uint32_t &e = expressionNumbering[exp];
    if (!e) e = nextValueNumber++;
    valueNumbering[C] = e;
    return e;
  } else if (AA->onlyReadsMemory(C)) {
    Expression exp = create_expression(C);
    uint32_t &e = expressionNumbering[exp];
    if (!e) {
      e = nextValueNumber++;
      valueNumbering[C] = e;
      return e;
    }
    if (!MD) {
      e = nextValueNumber++;
      valueNumbering[C] = e;
      return e;
    }

    MemDepResult local_dep = MD->getDependency(C);

    if (!local_dep.isDef() && !local_dep.isNonLocal()) {
      valueNumbering[C] =  nextValueNumber;
      return nextValueNumber++;
    }

    if (local_dep.isDef()) {
      CallInst* local_cdep = cast<CallInst>(local_dep.getInst());

      if (local_cdep->getNumArgOperands() != C->getNumArgOperands()) {
        valueNumbering[C] = nextValueNumber;
        return nextValueNumber++;
      }

      for (unsigned i = 0, e = C->getNumArgOperands(); i < e; ++i) {
        uint32_t c_vn = lookup_or_add(C->getArgOperand(i));
        uint32_t cd_vn = lookup_or_add(local_cdep->getArgOperand(i));
        if (c_vn != cd_vn) {
          valueNumbering[C] = nextValueNumber;
          return nextValueNumber++;
        }
      }

      uint32_t v = lookup_or_add(local_cdep);
      valueNumbering[C] = v;
      return v;
    }

    // Non-local case.
    const MemoryDependenceAnalysis::NonLocalDepInfo &deps =
      MD->getNonLocalCallDependency(CallSite(C));
    // FIXME: Move the checking logic to MemDep!
    CallInst* cdep = 0;

    // Check to see if we have a single dominating call instruction that is
    // identical to C.
    for (unsigned i = 0, e = deps.size(); i != e; ++i) {
      const NonLocalDepEntry *I = &deps[i];
      if (I->getResult().isNonLocal())
        continue;

      // We don't handle non-definitions.  If we already have a call, reject
      // instruction dependencies.
      if (!I->getResult().isDef() || cdep != 0) {
        cdep = 0;
        break;
      }

      CallInst *NonLocalDepCall = dyn_cast<CallInst>(I->getResult().getInst());
      // FIXME: All duplicated with non-local case.
      if (NonLocalDepCall && DT->properlyDominates(I->getBB(), C->getParent())){
        cdep = NonLocalDepCall;
        continue;
      }

      cdep = 0;
      break;
    }

    if (!cdep) {
      valueNumbering[C] = nextValueNumber;
      return nextValueNumber++;
    }

    if (cdep->getNumArgOperands() != C->getNumArgOperands()) {
      valueNumbering[C] = nextValueNumber;
      return nextValueNumber++;
    }
    for (unsigned i = 0, e = C->getNumArgOperands(); i < e; ++i) {
      uint32_t c_vn = lookup_or_add(C->getArgOperand(i));
      uint32_t cd_vn = lookup_or_add(cdep->getArgOperand(i));
      if (c_vn != cd_vn) {
        valueNumbering[C] = nextValueNumber;
        return nextValueNumber++;
      }
    }

    uint32_t v = lookup_or_add(cdep);
    valueNumbering[C] = v;
    return v;

  } else {
    valueNumbering[C] = nextValueNumber;
    return nextValueNumber++;
  }
}

/// lookup_or_add - Returns the value number for the specified value, assigning
/// it a new number if it did not have one before.
uint32_t ValueTable::lookup_or_add(Value *V) {
  DenseMap<Value*, uint32_t>::iterator VI = valueNumbering.find(V);
  if (VI != valueNumbering.end())
    return VI->second;

  if (!isa<Instruction>(V)) {
    valueNumbering[V] = nextValueNumber;
    return nextValueNumber++;
  }

  Instruction* I = cast<Instruction>(V);
  Expression exp;
  switch (I->getOpcode()) {
    case Instruction::Call:
      return lookup_or_add_call(cast<CallInst>(I));
    case Instruction::Add:
    case Instruction::FAdd:
    case Instruction::Sub:
    case Instruction::FSub:
    case Instruction::Mul:
    case Instruction::FMul:
    case Instruction::UDiv:
    case Instruction::SDiv:
    case Instruction::FDiv:
    case Instruction::URem:
    case Instruction::SRem:
    case Instruction::FRem:
    case Instruction::Shl:
    case Instruction::LShr:
    case Instruction::AShr:
    case Instruction::And:
    case Instruction::Or:
    case Instruction::Xor:
    case Instruction::ICmp:
    case Instruction::FCmp:
    case Instruction::Trunc:
    case Instruction::ZExt:
    case Instruction::SExt:
    case Instruction::FPToUI:
    case Instruction::FPToSI:
    case Instruction::UIToFP:
    case Instruction::SIToFP:
    case Instruction::FPTrunc:
    case Instruction::FPExt:
    case Instruction::PtrToInt:
    case Instruction::IntToPtr:
    case Instruction::BitCast:
    case Instruction::Select:
    case Instruction::ExtractElement:
    case Instruction::InsertElement:
    case Instruction::ShuffleVector:
    case Instruction::InsertValue:
    case Instruction::GetElementPtr:
      exp = create_expression(I);
      break;
    case Instruction::ExtractValue:
      exp = create_extractvalue_expression(cast<ExtractValueInst>(I));
      break;
    default:
      valueNumbering[V] = nextValueNumber;
      return nextValueNumber++;
  }

  uint32_t& e = expressionNumbering[exp];
  if (!e) e = nextValueNumber++;
  valueNumbering[V] = e;
  return e;
}

/// lookup - Returns the value number of the specified value. Fails if
/// the value has not yet been numbered.
uint32_t ValueTable::lookup(Value *V) const {
  DenseMap<Value*, uint32_t>::const_iterator VI = valueNumbering.find(V);
  assert(VI != valueNumbering.end() && "Value not numbered?");
  return VI->second;
}

/// lookup_or_add_cmp - Returns the value number of the given comparison,
/// assigning it a new number if it did not have one before.  Useful when
/// we deduced the result of a comparison, but don't immediately have an
/// instruction realizing that comparison to hand.
uint32_t ValueTable::lookup_or_add_cmp(unsigned Opcode,
                                       CmpInst::Predicate Predicate,
                                       Value *LHS, Value *RHS) {
  Expression exp = create_cmp_expression(Opcode, Predicate, LHS, RHS);
  uint32_t& e = expressionNumbering[exp];
  if (!e) e = nextValueNumber++;
  return e;
}

/// clear - Remove all entries from the ValueTable.
void ValueTable::clear() {
  valueNumbering.clear();
  expressionNumbering.clear();
  nextValueNumber = 1;
}

/// erase - Remove a value from the value numbering.
void ValueTable::erase(Value *V) {
  valueNumbering.erase(V);
}

/// verifyRemoved - Verify that the value is removed from all internal data
/// structures.
void ValueTable::verifyRemoved(const Value *V) const {
  for (DenseMap<Value*, uint32_t>::const_iterator
         I = valueNumbering.begin(), E = valueNumbering.end(); I != E; ++I) {
    assert(I->first != V && "Inst still occurs in value numbering map!");
  }
}

bool PRE::runOnFunction(Function &F) {
  //VN  = &getAnalysis<ValueNumbering>();
  DS  = &getAnalysis<DominatorSet>();
  DT  = &getAnalysis<DominatorTree>();
  DF  = &getAnalysis<DominanceFrontier>();
  PDT = &getAnalysis<PostDominatorTree>();
  PDF = &getAnalysis<PostDominanceFrontier>();

  DEBUG(std::cerr << "\n*** Running PRE on func '" << F.getName() << "'...\n");

  // Number the basic blocks based on a reverse post-order traversal of the CFG
  // so that all predecessors of a block (ignoring back edges) are visited
  // before a block is visited.
  //
  BlockMapping.reserve(F.size());
  {
    ReversePostOrderTraversal<Function*> RPOT(&F);
    DEBUG(std::cerr << "Block order: ");
    for (ReversePostOrderTraversal<Function*>::rpo_iterator I = RPOT.begin(),
           E = RPOT.end(); I != E; ++I) {
      // Keep track of mapping...
      BasicBlock *BB = *I;
      BlockNumbering.insert(std::make_pair(BB, BlockMapping.size()));
      BlockMapping.push_back(BB);
      DEBUG(std::cerr << BB->getName() << " ");
    }
    DEBUG(std::cerr << "\n");
  }

  // Traverse the current function depth-first in dominator-tree order.  This
  // ensures that we see all definitions before their uses (except for PHI
  // nodes), allowing us to hoist dependent expressions correctly.
  bool Changed = false;
  for (unsigned i = 0, e = BlockMapping.size(); i != e; ++i)
    Changed |= ProcessBlock(BlockMapping[i]);

  // Free memory
  BlockMapping.clear();
  BlockNumbering.clear();
  ProcessedExpressions.clear();
  return Changed;
}


// ProcessBlock - Process any expressions first seen in this block...
//
bool PRE::ProcessBlock(BasicBlock *BB) {
  bool Changed = false;

  // PRE expressions first defined in this block...
  Instruction *PrevInst = 0;
  for (BasicBlock::iterator I = BB->begin(); I != BB->end(); )
    if (ProcessExpression(I)) {
      // The current instruction may have been deleted, make sure to back up to
      // PrevInst instead.
      if (PrevInst)
        I = PrevInst;
      else
        I = BB->begin();
      Changed = true;
    } else {
      PrevInst = I++;
    }

  return Changed;
}

void PRE::MarkPostDominatingBlocksAnticipatible(PostDominatorTree::Node *N,
                                                std::vector<char> &AntBlocks,
                                                Instruction *Occurrence) {
  unsigned BlockNo = BlockNumbering[N->getBlock()];

  if (AntBlocks[BlockNo]) return;  // Already known to be anticipatible??

  // Check to see if any of the operands are defined in this block, if so, the
  // entry of this block does not anticipate the expression.  This computes
  // "transparency".
  for (unsigned i = 0, e = Occurrence->getNumOperands(); i != e; ++i)
    if (Instruction *I = dyn_cast<Instruction>(Occurrence->getOperand(i)))
      if (I->getParent() == N->getBlock())  // Operand is defined in this block!
        return;

  if (isa<LoadInst>(Occurrence))
    return;        // FIXME: compute transparency for load instructions using AA

  // Insert block into AntBlocks list...
  AntBlocks[BlockNo] = true;

  for (PostDominatorTree::Node::iterator I = N->begin(), E = N->end(); I != E;
       ++I)
    MarkPostDominatingBlocksAnticipatible(*I, AntBlocks, Occurrence);
}

void PRE::CalculateAnticipatiblityForOccurrence(unsigned BlockNo,
                                                std::vector<char> &AntBlocks,
                                                Instruction *Occurrence) {
  if (AntBlocks[BlockNo]) return;  // Block already anticipatible!

  BasicBlock *BB = BlockMapping[BlockNo];

  // For each occurrence, mark all post-dominated blocks as anticipatible...
  MarkPostDominatingBlocksAnticipatible(PDT->getNode(BB), AntBlocks,
                                        Occurrence);

  // Next, mark any blocks in the post-dominance frontier as anticipatible iff
  // all successors are anticipatible.
  //
  PostDominanceFrontier::iterator PDFI = PDF->find(BB);
  if (PDFI != DF->end())
    for (std::set<BasicBlock*>::iterator DI = PDFI->second.begin();
         DI != PDFI->second.end(); ++DI) {
      BasicBlock *PDFBlock = *DI;
      bool AllSuccessorsAnticipatible = true;
      for (succ_iterator SI = succ_begin(PDFBlock), SE = succ_end(PDFBlock);
           SI != SE; ++SI)
        if (!AntBlocks[BlockNumbering[*SI]]) {
          AllSuccessorsAnticipatible = false;
          break;
        }

      if (AllSuccessorsAnticipatible)
        CalculateAnticipatiblityForOccurrence(BlockNumbering[PDFBlock],
                                              AntBlocks, Occurrence);
    }
}


void PRE::CalculateAnticipatibleBlocks(const std::map<unsigned,
                                                      Instruction*> &Defs,
                                       std::vector<char> &AntBlocks) {
  // Initialize to zeros...
  AntBlocks.resize(BlockMapping.size());

  // Loop over all of the expressions...
  for (std::map<unsigned, Instruction*>::const_iterator I = Defs.begin(),
         E = Defs.end(); I != E; ++I)
    CalculateAnticipatiblityForOccurrence(I->first, AntBlocks, I->second);
}

/// MarkOccurrenceAvailableInAllDominatedBlocks - Add entries to AvailableBlocks
/// for all nodes dominated by the occurrence to indicate that it is now the
/// available occurrence to use in any of these blocks.
///
void PRE::MarkOccurrenceAvailableInAllDominatedBlocks(Instruction *Occurrence,
                                                      BasicBlock *BB) {
  // FIXME: There are much more efficient ways to get the blocks dominated
  // by a block.  Use them.
  //
  DominatorTree::Node *N = DT->getNode(Occurrence->getParent());
  for (df_iterator<DominatorTree::Node*> DI = df_begin(N), E = df_end(N);
       DI != E; ++DI)
    AvailableBlocks[(*DI)->getBlock()] = Occurrence;
}

/// ReplaceDominatedAvailableOccurrencesWith - This loops over the region
/// dominated by N, replacing any available expressions with NewOcc.
void PRE::ReplaceDominatedAvailableOccurrencesWith(Instruction *NewOcc,
                                                   DominatorTree::Node *N) {
  BasicBlock *BB = N->getBlock();
  Instruction *&ExistingAvailableVal = AvailableBlocks[BB];

  // If there isn't a definition already active in this node, make this the new
  // active definition...
  if (ExistingAvailableVal == 0) {
    ExistingAvailableVal = NewOcc;
    
    for (DominatorTree::Node::iterator I = N->begin(), E = N->end(); I != E;++I)
      ReplaceDominatedAvailableOccurrencesWith(NewOcc, *I);
  } else {
    // If there is already an active definition in this block, replace it with
    // NewOcc, and force it into all dominated blocks.
    DEBUG(std::cerr << "  Replacing dominated occ %"
          << ExistingAvailableVal->getName() << " with %" << NewOcc->getName()
          << "\n");
    assert(ExistingAvailableVal != NewOcc && "NewOcc already inserted??");
    ExistingAvailableVal->replaceAllUsesWith(NewOcc);
    ++NumRedundant;

    assert(ExistingAvailableVal->getParent() == BB &&
           "OldOcc not defined in current block?");
    BB->getInstList().erase(ExistingAvailableVal);

    // Mark NewOCC as the Available expression in all blocks dominated by BB
    for (df_iterator<DominatorTree::Node*> DI = df_begin(N), E = df_end(N);
         DI != E; ++DI)
      AvailableBlocks[(*DI)->getBlock()] = NewOcc;
  }  
}


/// ProcessExpression - Given an expression (instruction) process the
/// instruction to remove any partial redundancies induced by equivalent
/// computations.  Note that we only need to PRE each expression once, so we
/// keep track of whether an expression has been PRE'd already, and don't PRE an
/// expression again.  Expressions may be seen multiple times because process
/// the entire equivalence class at once, which may leave expressions later in
/// the control path.
///
bool PRE::ProcessExpression(Instruction *Expr) {
  if (Expr->mayWriteToMemory() || Expr->getType() == Type::VoidTy ||
      isa<PHINode>(Expr))
    return false;         // Cannot move expression
  if (ProcessedExpressions.count(Expr)) return false; // Already processed.

  // Ok, this is the first time we have seen the expression.  Build a set of
  // equivalent expressions using SSA def/use information.  We consider
  // expressions to be equivalent if they are the same opcode and have
  // equivalent operands.  As a special case for SSA, values produced by PHI
  // nodes are considered to be equivalent to all of their operands.
  //
  std::vector<Value*> Values;
  //VN->getEqualNumberNodes(Expr, Values);

#if 0
  // FIXME: This should handle PHI nodes correctly.  To do this, we need to
  // consider expressions of the following form equivalent to this set of
  // expressions:
  //
  // If an operand is a PHI node, add any occurrences of the expression with the
  // PHI operand replaced with the PHI node operands.  This is only valid if the
  // PHI operand occurrences exist in blocks post-dominated by the incoming edge
  // of the PHI node.
#endif

  // We have to be careful to handle expression definitions which dominated by
  // other expressions.  These can be directly eliminated in favor of their
  // dominating value.  Keep track of which blocks contain definitions (the key)
  // and if a block contains a definition, which instruction it is.
  //
  std::map<unsigned, Instruction*> Definitions;
  Definitions.insert(std::make_pair(BlockNumbering[Expr->getParent()], Expr));

  bool Changed = false;

  // Look at all of the equal values.  If any of the values is not an
  // instruction, replace all other expressions immediately with it (it must be
  // an argument or a constant or something). Otherwise, convert the list of
  // values into a list of expression (instruction) definitions ordering
  // according to their dominator tree ordering.
  //
  Value *NonInstValue = 0;
  for (unsigned i = 0, e = Values.size(); i != e; ++i)
    if (Instruction *I = dyn_cast<Instruction>(Values[i])) {
      Instruction *&BlockInst = Definitions[BlockNumbering[I->getParent()]];
      if (BlockInst && BlockInst != I) {    // Eliminate direct redundancy
        if (DS->dominates(I, BlockInst)) {  // I dom BlockInst
          BlockInst->replaceAllUsesWith(I);
          BlockInst->getParent()->getInstList().erase(BlockInst);
        } else {                            // BlockInst dom I
          I->replaceAllUsesWith(BlockInst);
          I->getParent()->getInstList().erase(I);
          I = BlockInst;
        }
        ++NumRedundant;
      }
      BlockInst = I;
    } else {
      NonInstValue = Values[i];
    }

  std::vector<Value*>().swap(Values);  // Done with the values list

  if (NonInstValue) {
    // This is the good, though unlikely, case where we find out that this
    // expression is equal to a constant or argument directly.  We can replace
    // this and all of the other equivalent instructions with the value
    // directly.
    //
    for (std::map<unsigned, Instruction*>::iterator I = Definitions.begin(),
           E = Definitions.end(); I != E; ++I) {
      Instruction *Inst = I->second;
      // Replace the value with the specified non-instruction value.
      Inst->replaceAllUsesWith(NonInstValue);       // Fixup any uses
      Inst->getParent()->getInstList().erase(Inst); // Erase the instruction
    }
    NumExprsEliminated += Definitions.size();
    return true;   // Program modified!
  }

  // There are no expressions equal to this one.  Exit early.
  assert(!Definitions.empty() && "no equal expressions??");
#if 0
  if (Definitions.size() == 1) {
    ProcessedExpressions.insert(Definitions.begin()->second);
    return Changed;
  }
#endif
  DEBUG(std::cerr << "\n====--- Expression: " << *Expr);
  const Type *ExprType = Expr->getType();

  // AnticipatibleBlocks - Blocks where the current expression is anticipatible.
  // This is logically std::vector<bool> but using 'char' for performance.
  std::vector<char> AnticipatibleBlocks;

  // Calculate all of the blocks which the current expression is anticipatible.
  CalculateAnticipatibleBlocks(Definitions, AnticipatibleBlocks);

  // Print out anticipatible blocks...
  DEBUG(std::cerr << "AntBlocks: ";
        for (unsigned i = 0, e = AnticipatibleBlocks.size(); i != e; ++i)
          if (AnticipatibleBlocks[i])
            std::cerr << BlockMapping[i]->getName() <<" ";
        std::cerr << "\n";);
  


  // AvailabilityFrontier - Calculates the availability frontier for the current
  // expression.  The availability frontier contains the blocks on the dominance
  // frontier of the current available expressions, iff they anticipate a
  // definition of the expression.
  hash_set<unsigned> AvailabilityFrontier;

  Instruction *NonPHIOccurrence = 0;

  while (!Definitions.empty() || !AvailabilityFrontier.empty()) {
    if (!Definitions.empty() &&
        (AvailabilityFrontier.empty() ||
         Definitions.begin()->first < *AvailabilityFrontier.begin())) {
      Instruction *Occurrence = Definitions.begin()->second;
      BasicBlock *BB = Occurrence->getParent();
      Definitions.erase(Definitions.begin());

      DEBUG(std::cerr << "PROCESSING Occurrence: " << *Occurrence);

      // Check to see if there is already an incoming value for this block...
      AvailableBlocksTy::iterator LBI = AvailableBlocks.find(BB);
      if (LBI != AvailableBlocks.end()) {
        // Yes, there is a dominating definition for this block.  Replace this
        // occurrence with the incoming value.
        if (LBI->second != Occurrence) {
          DEBUG(std::cerr << "  replacing with: " << *LBI->second);
          Occurrence->replaceAllUsesWith(LBI->second);
          BB->getInstList().erase(Occurrence);   // Delete instruction
          ++NumRedundant;
        }
      } else {
        ProcessedExpressions.insert(Occurrence);
        if (!isa<PHINode>(Occurrence))
          NonPHIOccurrence = Occurrence;  // Keep an occurrence of this expr

        // Okay, there is no incoming value for this block, so this expression
        // is a new definition that is good for this block and all blocks
        // dominated by it.  Add this information to the AvailableBlocks map.
        //
        MarkOccurrenceAvailableInAllDominatedBlocks(Occurrence, BB);

        // Update the dominance frontier for the definitions so far... if a node
        // in the dominator frontier now has all of its predecessors available,
        // and the block is in an anticipatible region, we can insert a PHI node
        // in that block.
        DominanceFrontier::iterator DFI = DF->find(BB);
        if (DFI != DF->end()) {
          for (std::set<BasicBlock*>::iterator DI = DFI->second.begin();
               DI != DFI->second.end(); ++DI) {
            BasicBlock *DFBlock = *DI;
            unsigned DFBlockID = BlockNumbering[DFBlock];
            if (AnticipatibleBlocks[DFBlockID]) {
              // Check to see if any of the predecessors of this block on the
              // frontier are not available...
              bool AnyNotAvailable = false;
              for (pred_iterator PI = pred_begin(DFBlock),
                     PE = pred_end(DFBlock); PI != PE; ++PI)
                if (!AvailableBlocks.count(*PI)) {
                  AnyNotAvailable = true;
                  break;
                }
            
              // If any predecessor blocks are not available, add the node to
              // the current expression dominance frontier.
              if (AnyNotAvailable) {
                AvailabilityFrontier.insert(DFBlockID);
              } else {
                // This block is no longer in the availability frontier, it IS
                // available.
                AvailabilityFrontier.erase(DFBlockID);

                // If all of the predecessor blocks are available (and the block
                // anticipates a definition along the path to the exit), we need
                // to insert a new PHI node in this block.  This block serves as
                // a new definition for the expression, extending the available
                // region.
                //
                PHINode *PN = new PHINode(ExprType, Expr->getName()+".pre",
                                          DFBlock->begin());
                ProcessedExpressions.insert(PN);

                DEBUG(std::cerr << "  INSERTING PHI on frontier: " << *PN);

                // Add the incoming blocks for the PHI node
                for (pred_iterator PI = pred_begin(DFBlock),
                       PE = pred_end(DFBlock); PI != PE; ++PI)
                  if (*PI != DFBlock)
                    PN->addIncoming(AvailableBlocks[*PI], *PI);
                  else                          // edge from the current block
                    PN->addIncoming(PN, DFBlock);

                Instruction *&BlockOcc = Definitions[DFBlockID];
                if (BlockOcc) {
                  DEBUG(std::cerr <<"    PHI superceeds occurrence: "<<
                        *BlockOcc);
                  BlockOcc->replaceAllUsesWith(PN);
                  BlockOcc->getParent()->getInstList().erase(BlockOcc);
                  ++NumRedundant;
                }
                BlockOcc = PN;
              }
            }
          }
        }
      }

    } else {
      // Otherwise we must be looking at a node in the availability frontier!
      unsigned AFBlockID = *AvailabilityFrontier.begin();
      AvailabilityFrontier.erase(AvailabilityFrontier.begin());
      BasicBlock *AFBlock = BlockMapping[AFBlockID];

      // We eliminate the partial redundancy on this frontier by inserting a PHI
      // node into this block, merging any incoming available versions into the
      // PHI and inserting a new computation into predecessors without an
      // incoming value.  Note that we would have to insert the expression on
      // the edge if the predecessor didn't anticipate the expression and we
      // didn't break critical edges.
      //
      PHINode *PN = new PHINode(ExprType, Expr->getName()+".PRE",
                                AFBlock->begin());
      DEBUG(std::cerr << "INSERTING PHI for PR: " << *PN);

      // If there is a pending occurrence in this block, make sure to replace it
      // with the PHI node...
      std::map<unsigned, Instruction*>::iterator EDFI =
        Definitions.find(AFBlockID);
      if (EDFI != Definitions.end()) {
        // There is already an occurrence in this block.  Replace it with PN and
        // remove it.
        Instruction *OldOcc = EDFI->second;
        DEBUG(std::cerr << "  Replaces occurrence: " << *OldOcc);
        OldOcc->replaceAllUsesWith(PN);
        AFBlock->getInstList().erase(OldOcc);
        Definitions.erase(EDFI);
        ++NumRedundant;
      }

      for (pred_iterator PI = pred_begin(AFBlock), PE = pred_end(AFBlock);
           PI != PE; ++PI) {
        BasicBlock *Pred = *PI;
        AvailableBlocksTy::iterator LBI = AvailableBlocks.find(Pred);
        if (LBI != AvailableBlocks.end()) {    // If there is a available value
          PN->addIncoming(LBI->second, Pred);  // for this pred, use it.
        } else {                         // No available value yet...
          unsigned PredID = BlockNumbering[Pred];

          // Is the predecessor the same block that we inserted the PHI into?
          // (self loop)
          if (Pred == AFBlock) {
            // Yes, reuse the incoming value here...
            PN->addIncoming(PN, Pred);
          } else {
            // No, we must insert a new computation into this block and add it
            // to the definitions list...
            assert(NonPHIOccurrence && "No non-phi occurrences seen so far???");
            Instruction *New = NonPHIOccurrence->clone();
            New->setName(NonPHIOccurrence->getName() + ".PRE-inserted");
            ProcessedExpressions.insert(New);

            DEBUG(std::cerr << "  INSERTING OCCURRRENCE: " << *New);

            // Insert it into the bottom of the predecessor, right before the
            // terminator instruction...
            Pred->getInstList().insert(Pred->getTerminator(), New);

            // Make this block be the available definition for any blocks it
            // dominates.  The ONLY case that this can affect more than just the
            // block itself is when we are moving a computation to a loop
            // header.  In all other cases, because we don't have critical
            // edges, the node is guaranteed to only dominate itself.
            //
            ReplaceDominatedAvailableOccurrencesWith(New, DT->getNode(Pred));

            // Add it as an incoming value on this edge to the PHI node
            PN->addIncoming(New, Pred);
            NonPHIOccurrence = New;
            NumInserted++;
          }
        }
      }

      // Find out if there is already an available value in this block.  If so,
      // we need to replace the available value with the PHI node.  This can
      // only happen when we just inserted a PHI node on a backedge.
      //
      AvailableBlocksTy::iterator LBBlockAvailableValIt =
        AvailableBlocks.find(AFBlock);
      if (LBBlockAvailableValIt != AvailableBlocks.end()) {
        if (LBBlockAvailableValIt->second->getParent() == AFBlock) {
          Instruction *OldVal = LBBlockAvailableValIt->second;
          OldVal->replaceAllUsesWith(PN);        // Use the new PHI node now
          ++NumRedundant;
          DEBUG(std::cerr << "  PHI replaces available value: %"
                << OldVal->getName() << "\n");
          
          // Loop over all of the blocks dominated by this PHI node, and change
          // the AvailableBlocks entries to be the PHI node instead of the old
          // instruction.
          MarkOccurrenceAvailableInAllDominatedBlocks(PN, AFBlock);
          
          AFBlock->getInstList().erase(OldVal);  // Delete old instruction!

          // The resultant PHI node is a new definition of the value!
          Definitions.insert(std::make_pair(AFBlockID, PN));
        } else {
          // If the value is not defined in this block, that means that an
          // inserted occurrence in a predecessor is now the live value for the
          // region (occurs when hoisting loop invariants, f.e.).  In this case,
          // the PHI node should actually just be removed.
          assert(PN->use_empty() && "No uses should exist for dead PHI node!");
          PN->getParent()->getInstList().erase(PN);            
        }
      } else {
        // The resultant PHI node is a new definition of the value!
        Definitions.insert(std::make_pair(AFBlockID, PN));
      }
    }
  }

  AvailableBlocks.clear();

  return Changed;
}

