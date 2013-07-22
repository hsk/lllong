int a(int b) { return b; }
typedef int (*FF)(int);
int (*g)(int);

int main() {
  FF f = a;
  g = a;
  f(10);
  f = g;
  f(10);
  return 0;
}
