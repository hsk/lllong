void print_l(long a);

void main() {
  long a[10];
  long* p = a;
  p[1] = 100;
  p = p + 1;
  print_l(p[0]);
}
