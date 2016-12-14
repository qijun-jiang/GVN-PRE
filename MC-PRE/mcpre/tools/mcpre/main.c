#include "mcpre.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main (int argc, char ** argv)
{
  printf ("%d\n", compute_mcpre (5));
  exit (0);
}

