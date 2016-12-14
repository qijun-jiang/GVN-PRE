RUN MC-PRE pass on sample.c :
1. go to GVN-PRE/opcstats/
2. copy your .c file there, say it is "sample.c"
3. run: ./commands.sh sample
4. you should see sample, sample.nomc and sample.mcpre in the folder
5. run: ./sample for original compile (no optimization)
        ./sample.nopre for "-mem2reg -loop-rotate -reassociate -mem2reg -simplifycfg" flags (baseline)
        ./sample.mcpre for "-mcpre -mem2reg" flag (MC-PRE)
* Note: commands.sh script can only support .c file

Run performance test
1. Run mcpre pass for all benchmarks: python performance.py [benchmark_list_file_name] 1
2. Collect execution time: python performance.py [benchmark_list_file_name] 0

Run correctness test
./correctness.sh
