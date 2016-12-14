export PATH=${PATH}:/opt/llvm/Release+Asserts/bin

fname=$1

rm llvmprof.out
rm -rf *bc
rm -rf *profile*
rm -rf *ll
rm -rf *.s

## Get the simple profile data
echo "[Get the simple profile data:]"
clang -emit-llvm -o $fname.bc -c $fname.c
opt -loop-simplify < $fname.bc > $fname.ls.bc
opt -insert-edge-profiling $fname.ls.bc -o $fname.profile.ls.bc
llc $fname.profile.ls.bc -o $fname.profile.ls.s
g++ -o $fname.profile $fname.profile.ls.s /opt/llvm/Release+Asserts/lib/libprofile_rt.so
./$fname.profile

## Run your pass
echo "[Run your pass:]"
# baseline pass without MC-PRE
opt -mem2reg -loop-rotate -reassociate -mem2reg -simplifycfg < $fname.ls.bc > $fname.nomc.bc
# MC-PRE pass
opt -basicaa -load Release+Asserts/lib/mcpre.so -profile-loader -profile-info-file=llvmprof.out -mcpre -mem2reg < $fname.ls.bc > $fname.mcpre.bc

## Generate executables and ensure that your modified IR generates correct output
llc $fname.bc -o $fname.s
g++ -o $fname $fname.s
llc $fname.mcpre.bc -o $fname.mcpre.s
g++ -o $fname.mcpre $fname.mcpre.s
llc $fname.nomc.bc -o $fname.nomc.s
g++ -o $fname.nomc $fname.nomc.s