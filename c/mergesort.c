#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/* When recursion reaches maximum, return pointer to array and size in memory
 * Do first for left, then right, concatenate arrays into new one
 * Wipe memory of left and right, return new pointer to concatenated array */

/* Things to work out:
 * 1. Split array in half correctly
 * 2. Return two values from a function? */

int get_input() {
  printf("Input limit:\n");
  int input;
  scanf("%d", &input);
  return input;
}

int recurse(int array, int size) {
  if (size <= 1) {
    return array;
  }
  int split_l = size/2;
  int left[split_l];
  for (int i = 0; i < size/2; i++) {
    left[i] = array[i];
  }
  recurse(left, split_l);
  return 0;
}


int main() {
  int input = get_input();
  int array[input];
  for (int i = 0; i < input; i++ ) {
    array[i] = (rand() % input);
  };
  int size = sizeof(array) / sizeof(int);
  recurse(array, size);
  return 0;
}


