#!/bin/bash
rm *.out

while read line; do
	echo "Benchmark: $line"
	./$line.nomc > $line.reference.out
	./$line.mcpre > $line.out
	diff $line.out $line.reference.out
	echo "------------------------------"
done < benchmark_set1.txt

while read line; do
	echo "Benchmark: $line"
	./$line.nomc > $line.reference.out
	./$line.mcpre > $line.out
	diff $line.out $line.reference.out
	echo "------------------------------"
done < benchmark_set2.txt
