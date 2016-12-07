#include "stdio.h"
#include "time.h"

int main() {
  
  clock_t start;
  double duration;

  start = clock();
  long a = 23423234342342, b = 4234234234234234;
  long c;
  for (int out = 0; out < 30000; out++)
    for (int i = 0; i < 12; i++) {
      if (i % 3 == 0) {
        if (i%2) 
          a = a - 1;
        else 
          a= a + 1;
      } else {
        c = a + b;
      }

      if (i % 2 == 0 ) {
        int k = i / 2;
        if (k % 3 == 0) {
          c = a + b;
        } 
      } else {
        int k = (i - 1) / 2;
        if (k % 3 != 0) {
          c = a + b;
        }
        c = 0;
        c = a + b;
      }
    }
  
  duration = ( clock() - start ) / (double) CLOCKS_PER_SEC * 1000;
  printf("%f\n", duration);
  
  return 0;
}