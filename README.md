RUN MC-PRE pass on sample.c :
1. go to GVN-PRE/opcstats/
2. copy your .c file there, say it is "sample.c"
3. run: ./commands.sh sample
4. you should see sample, sample.nomc and sample.mcpre in the folder
5. run: ./sample for original compile (no optimization)
        ./sample.nopre for "-mem2reg -loop-rotate -reassociate -mem2reg -simplifycfg" flags (baseline)
        ./sample.mcpre for "-mcpre -mem2reg" flag (MC-PRE)
* Note: commands.sh script can only support .c file



