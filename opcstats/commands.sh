export PATH=${PATH}:/opt/llvm/Release+Asserts/bin

fname=$1

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
opt -basicaa -load /home/qijun/GVN-PRE/opcstats/Release+Asserts/lib/opcstats.so -profile-loader -profile-info-file=llvmprof.out -mcpre -mem2reg < $fname.ls.bc > $fname.slicm.bc

## Compare original and modified IRllvm-dis $fname.ls.bc
llvm-dis $fname.slicm.bc

## Generate executables and ensure that your modified IR generates correct output
llc $fname.bc -o $fname.s
g++ -o $fname $fname.s
llc $fname.slicm.bc -o $fname.slicm.s
g++ -o $fname.slicm $fname.slicm.s

## Once you are sure that your pass works then use mem2reg pass to convert some intermediate load stores to register transfers
##opt -basicaa -load /home/qijun/ldstats/Release+Asserts/lib/ldstats.so -lamp-inst-cnt -lamp-map-loop -lamp-load-profile -profile-loader -profile-info-file=llvmprof.out -slicm -mem2reg < correct1.ls.bc > correct1.slicm.bc

