void print_l(long a);
void main() {
  struct {char a; struct{char c;} b; } b;
  b.a = 3;
  print_l(b.b.c);
}
