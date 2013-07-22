void print_l(long b);
void main() {
  long a = 1;
  long b = 0;
  long c = 555;
  b = (a ? 2 : 3)+c;
  print_l(b);
}
