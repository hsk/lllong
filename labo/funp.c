#include <stdio.h>

int add(int a, int b) {
  return a + b;
}

int main() {
  int (*f)(int,int);
  f=add;

  printf("%d\n", f(1,2));
  return 0;
}
