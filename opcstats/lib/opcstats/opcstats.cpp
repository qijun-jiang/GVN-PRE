//opcstats.cpp test gitignore
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "llvm/Support/CFG.h"
#include "llvm/Support/Format.h"
using namespace llvm;
namespace {
	struct opcstats: public FunctionPass {
		static char ID;
		ProfileInfo* PI;
		opcstats(): FunctionPass(ID) { }
		virtual bool runOnFunction(Function &F) {
			//errs() << "Opcstats:";
			errs().write_escaped(F.getName()) << ",";
			PI = &getAnalysis<ProfileInfo>();
			double DynOpCount = 0;
			double IALUCount = 0;
			double FALUCount = 0;
			double MEMCount = 0;
			double BBCount = 0;
			double UBCount = 0;
			double OthCount = 0;
			for (Function::iterator b = F.begin(); b != F.end(); b++) {
				double execCount = PI->getExecutionCount(b);
				if (execCount <= 0)
					continue;
				for (BasicBlock::iterator i = b->begin(); i != b->end(); i++) {
					DynOpCount += execCount;
					if (i->getOpcode() == Instruction::Add ||
					    i->getOpcode() == Instruction::Sub ||
					    i->getOpcode() == Instruction::Mul ||
                                            i->getOpcode() == Instruction::UDiv ||
                                            i->getOpcode() == Instruction::SDiv ||
                                            i->getOpcode() == Instruction::URem ||
                                            i->getOpcode() == Instruction::Shl ||
                                            i->getOpcode() == Instruction::LShr ||
                                            i->getOpcode() == Instruction::AShr ||
                                            i->getOpcode() == Instruction::And ||
                                            i->getOpcode() == Instruction::Or ||
                                            i->getOpcode() == Instruction::Xor ||
                                            i->getOpcode() == Instruction::ICmp ||
                                            i->getOpcode() == Instruction::SRem)
					{
						IALUCount += execCount;
					}
                                        else if (i->getOpcode() == Instruction::FAdd ||
                                            i->getOpcode() == Instruction::FSub ||
                                            i->getOpcode() == Instruction::FMul ||
                                            i->getOpcode() == Instruction::FDiv ||
                                            i->getOpcode() == Instruction::FRem ||
                                            i->getOpcode() == Instruction::FCmp)
					{
						FALUCount += execCount;
					}
					else if (i->getOpcode() == Instruction::Alloca ||
                                            i->getOpcode() == Instruction::Load ||
                                            i->getOpcode() == Instruction::Store ||
                                            i->getOpcode() == Instruction::GetElementPtr ||
                                            i->getOpcode() == Instruction::Fence ||
                                            i->getOpcode() == Instruction::AtomicCmpXchg ||
                                            i->getOpcode() == Instruction::AtomicRMW)
					{
						MEMCount += execCount;
					}
					else if (i->getOpcode() == Instruction::Br ||
					    i->getOpcode() == Instruction::Switch ||
					    i->getOpcode() == Instruction::IndirectBr)
					{
						bool flag = false;
						for (succ_iterator bbi = succ_begin(b), bbe = succ_end(b); bbi != bbe; ++bbi) {
							ProfileInfo::Edge E = PI->getEdge(b, *bbi);
							double EdgeWeight = PI->getEdgeWeight(E)/execCount;
							if (EdgeWeight > 0.8) {
								flag = true;
								BBCount += execCount;
								break;
							}
						}
						if (!flag)
							UBCount += execCount;
					}
					else
					{
						OthCount += execCount;
					}
				}
			}

			double IALU = IALUCount == 0 ? 0 : IALUCount/DynOpCount;
			double FALU = FALUCount == 0 ? 0 : FALUCount/DynOpCount;
                        double MEM  = MEMCount  == 0 ? 0 : MEMCount/DynOpCount;
                        double BB   = BBCount   == 0 ? 0 : BBCount/DynOpCount;
                        double UB   = UBCount   == 0 ? 0 : UBCount/DynOpCount;
                        double OTH  = OthCount  == 0 ? 0 : OthCount/DynOpCount;

			errs() << format("%.0f", DynOpCount) << ","
			       << format("%.4f", IALU) << ","
			       << format("%.4f", FALU) << ","
			       << format("%.4f", MEM) << ","
			       << format("%.4f", BB) << ","
                               << format("%.4f", UB) << ","
                               << format("%.4f", OTH) << "\n";
			return false;
		}
		void getAnalysisUsage(AnalysisUsage &AU) const {
			AU.addRequired<ProfileInfo>();
		}
	};
}
char opcstats::ID = 0;
static RegisterPass<opcstats> X("opcstats", "opc stats", false, false);
