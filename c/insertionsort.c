#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void getInput(int* in) {
  printf("Input limit:\n");
  scanf("%d", in);
}

void getRandom(int* a, int* l, int* inp) {
  int in;
  getInput(&in);
  printf("Input: %d\n", in);
  a = malloc(in);
  if (!a) {
    fprintf(stderr, "Out of memory\n");
    exit(EXIT_FAILURE);
  }
  for (int i = 0; i < in; i++) {
    a[i] = (rand() % in);
  }
  inp = &in;
}

int main() {
  int a, l, inp;
  getRandom(&a, &l, &inp);
  printf("%d\n", inp);
  printf("%d\n", l);
  return 0;
}

/* int getRandom(int in, int* a, int* l) { */
/*   int *random = malloc(limit); */
/*   if (!random) { */
/*     fprintf(stderr, "out of memory\n"); */
/*     exit(EXIT_FAILURE); */
/*   } */
/*   for (int i = 0; i < limit; i++) { */
/*     random[i] = (rand() % limit); */
/*   } */
/*   int *size; */
/*   s = sizeof(random) / sizeof(int); */
/*   size = $s */
/*   return random; */
/* } */

