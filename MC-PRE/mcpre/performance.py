import subprocess
import time
import sys

DIR = "test"

file_name = sys.argv[1]

run_optimization = int(sys.argv[2])

f = open(file_name);

files = f.readlines();
N = 1

for fname in files:

	fname = fname.strip()
	
	fname = '/'.join([DIR, fname])

	if (run_optimization == 1):
		subprocess.check_output(['sh', 'commands.sh', fname])

	else:

		# print "-" * 40

		# print "Benchmark: " + fname
		print fname,  
		# print "NO Optimization: ", 
		average_time_noop = 0
		for i in xrange(N):
			start = time.time()
			subprocess.check_output(["./"+fname])
			end = time.time();
			average_time_noop += end - start
		average_time_noop /= N
		print average_time_noop, 


		# print "MC-PRE:", 
		average_time_pre = 0
		for i in xrange(N):
			start = time.time()
			pre_output = subprocess.check_output(["./"+fname+".mcpre"])
			end = time.time();
			average_time_pre += end - start
		average_time_pre /= N
		# print average_time_pre, 

		# print "NO PRE: ",
		average_time_nopre = 0
		for i in xrange(N):
			start = time.time()
			nopre_output = subprocess.check_output(["./"+fname+".nomc"])
			end = time.time();
			average_time_nopre += end - start
		average_time_nopre /= N
		print average_time_nopre, 

		print average_time_pre, 


		print average_time_nopre / average_time_noop,
		print average_time_pre / average_time_noop


# print "-" * 40
