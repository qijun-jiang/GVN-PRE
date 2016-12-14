#!/bin/bash
rm *.out

while read line; do
	echo "Benchmark: $line"
	./test/$line.nomc > $line.reference.out
	./test/$line.mcpre > $line.out
	diff $line.out $line.reference.out
	echo "------------------------------"
done < test/benchmark_set1.txt

while read line; do
	echo "Benchmark: $line"
	./test/$line.nomc > $line.reference.out
	./test/$line.mcpre > $line.out
	diff $line.out $line.reference.out
	echo "------------------------------"
done < test/benchmark_set2.txt
