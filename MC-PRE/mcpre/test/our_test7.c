#include "stdio.h"
#include <sys/resource.h>
#include <sys/time.h>

int func() {
  
  struct rusage stop, start;
  getrusage(RUSAGE_SELF, &start);
  long a = 23423234342342, b = 4234234234234234;
  long c, d;
  for (int out = 0; out < 30000; out++)
    for (int i = 0; i < 12; i++) {
      if (i % 3 == 0) {
        if (i%2) 
          a = a + 1;
        else 
          a = a + 2;
      } else {
        c = a + b;
        c = a * b + c;

        d = a / c + b + d;
      }

      if (i % 2 == 0 ) {
        int k = i / 2;
        if (k % 3 == 0) {
          c = a + b;

          d = a / c + b;
        } 
      } else {
        int k = (i - 1) / 2;
        if (k % 3 != 0) {
          c = a + b;
        }
        c = 0;
        c = a + b;
        d = a / c + b;
      }
      
    }
  
  getrusage(RUSAGE_SELF, &stop);
  double start_usec = start.ru_utime.tv_sec * 1000000 + start.ru_utime.tv_usec;
  double stop_usec = stop.ru_utime.tv_sec * 1000000 + stop.ru_utime.tv_usec;
  
  // printf("%d\n", (int)(stop_usec - start_usec));
  return stop_usec - start_usec;
  // return 0;
}

int main() {
  double ans = 0;
  for (int i = 0; i < 100; i++) {
    double t = func();
    ans += func();
  }
  ans /= 100;
  printf("%f\n", ans);
  return 0;
}
