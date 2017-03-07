#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

int* getRandom(int limit) {
  /* Allocates memory to enable return of array outside of function */
  int *random = malloc(limit);
  if (!random) {
    return NULL;
  }
  for (int i = 0; i < limit; i++ ) {
    random[i] = (rand() % limit);
  };
  return random;
}

int b_compare(int x, int y) {
  if (x > y) {
    return 1;
  }
  else {
    return 0;
  }
}

void swap( int array[], int a, int b ) {
  int temp = array[a];
  array[a] = array[b];
  array[b] = temp;
}

int getInput() {
  printf("Input limit:\n");
  int input;
  scanf("%d", &input);
  return input;
}

int main() {

  int limit = getInput();

  /* Generate randomised array of length &limit */
  int *array = getRandom(limit);

  if (array) {
    bool sorted = false;
    while (!sorted) {
      sorted = true;
      for(int i = 0; i < limit-1; i++) {
        char res = b_compare(array[i], array[i+1]);
        if (res == 1) {
          swap(array, i, i+1);
          sorted = false;
        }
      }
    }

    /* Print Results */
    for(int i = 0; i < limit; i++) {
      printf("%d, ", array[i]);
    }

    printf("\nExiting the program...\n");
  }

  return 0;
}

