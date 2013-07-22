void main() {
  struct A { char x; char y};
  struct A a;
  struct A b;
  struct A* p;
  p = &b;
  p--;
  a.x = 1;
  a.y = 2;
  b.x = 3;
  b.y = 4;
  printf("%d sizeof %d\n", p->x, sizeof(a));
}
