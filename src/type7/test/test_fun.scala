package type7.test
import type7._
object test_fun extends TestCase {
  import type7.test.test_globals._

  def apply() {
    // void テスト
    test("fun void",
      "def main():void = {" +
        "myprint(3);" +
        "}" +
        "def myprint(a:long):void = {" +
        "  print_l(a)" +
        "}",
      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "myprint"), List(ELd(Ti(64), 3)))))),
        EFun(Tv, "myprint", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(Tn, "print_l"), List(EId(Tn, "a")))))))),
      (0, "3\n", ""))

    test("fun inc long ",
      "def main():void = {" +
        "print_l(inc(1));" +
        "}" +
        "def inc(a:long):long = {" +
        "  a + 1" +
        "}",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_l"), List(ELd(Ti(64), 2)))))))),
      (0, "2\n", ""))

    test("fun inc int ",
      "def main():void = {" +
        "print_i(inc(1));" +
        "}" +
        "def inc(a:int):int = {" +
        "  a + 1" +
        "}",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_i"), List(ELd(Ti(32), 2)))))))),
      (0, "2\n", ""))

    test("fun inc byte",
      "def main():void = print_b(inc(127));" +
        "def inc(a:byte):byte = a + cast(byte)1",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_i"), List(ELd(Ti(32), -128)))))))),
      (0, "-128\n", ""))

    test("fun inc short",
      "def main():void = print_s(inc(32767));" +
        "def inc(a:short):short = a + cast(short)1",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_i"), List(ELd(Ti(32), -32768)))))))),
      (0, "-32768\n", ""))

    test("fun inc short",
      "def main():void = print_s(inc(32767));" +
        "def inc(a:short):short = a + cast(short)1",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_i"), List(ELd(Ti(32), -32768)))))))),
      (0, "-32768\n", ""))

    test("fun inc int ",
      "def main():void = print_i(inc(" + 0x7fffffff + "));" +
        "def inc(a:int):int = a + cast(int)1",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_i"), List(ELd(Ti(32), 0x80000000)))))))),
      (0, 0x80000000 + "\n", ""))

    test("fun inc double ",
      "def main():void = print_d(inc(1.0));" +
        "def inc(a:double):double = a + 1.0",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_d"),
              List(ELdd(Td, 2.0)))))))),
      (0, "2.000000\n", ""))

    test("fun inc float ",
      "def main():void = print_f(inc(2.0));" +
        "def inc(a:float):float = a + cast(float)1.0",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_f"), List(ELdd(Tf, 3.0)))))))),
      (0, "3.000000\n", ""))

    test("fun fact float ",
      "def main():void = {var a:long; a=10; print_l(fact(a));}" +
        "def fact(a:long):long = if(a==0) 1 else a * fact(a-1)",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_l"), List(ELd(Ti(64), 3628800)))))))),
      (0, "3628800\n", ""))

    test("fun fib long ",
      "def main():void = {var a:long; a=30; print_l(fact(a));}" +
        "def fact(a:long):long = if(a==0) 0 else if(a==1) 1 else fact(a-1)+fact(a-2)",

      Prog(List(
        EFun(Tv, "main", Map("a" -> Ti(64)), EBlock(Tv, List(
          ECall(Tv, EId(TFun(Tv, List(Ti(64))), "print_l"), List(ELd(Ti(64), 832040)))))))),
      (0, "832040\n", ""))

    test("typedef struct global scope.",
      "typedef HOGE = struct{a:int b:int} " +
        "def main():void = {var a:HOGE a.a = 1; a.b = 2; print_i(a.a); print_i(a.b)}",
      null,
      (0, "1\n2\n", ""))

    test("typedef struct global scope and local scope.",
      "typedef HOGE = struct{a:int b:int} " +
        "def main():void = {typedef HOGE = struct{a:int b:int c:int} var a:HOGE a.a = 1; a.b = 2; a.c = 3; print_i(a.a); print_i(a.b); print_i(a.c)}",
      null,
      (0, "1\n2\n3\n", ""))
    test("fun syntax sugger",
      "def main() {print_l(1);}",
      null,
      (0, "1\n", ""))

    test("global var",
      "var a=1; def main() {print_l(a);}",
      null,
      (0, "1\n", ""))
    test("global var",
      "var a:byte=1;var b:short=2; var c:int = 3; var d:float = 4.0 var e:double = 5.0; def main() {print_b(a);print_s(b);print_i(c);print_f(d); print_d(e)}",
      null,
      (0, "1\n2\n3\n4.000000\n5.000000\n", ""))
    /*
    test("global var",
      "var a=1; var c=a; def main() {print_l(c);}",
      null,
      (0, "1\n", ""))
      */
    test("global struct",
      "typedef A = struct {x:int; a:int} var a:A=(1,2) def main() {print_i(a.x);print_i(a.a);a.x=10;}",
      null,
      (0, "1\n2\n", ""))
    test("global array",
      "var a:int[10] def main() {a[9]=1;print_i(a[9]);}",
      null,
      (0, "1\n", ""))

    test("function pointer var",
      "def a(ff:(int)=>void) { ff(10) } def f(a:int){print_i(a)} def main() { a(f) }",
      null,
      (0, "10\n", ""))

Prog(List(
  EFun(Tv,"a",Map("ff" -> TFun(Tv,List(Ti(32)))),EBlock(Tn,List(
      ECall(Tn,EId(Tn,"ff"),List(ELd(Tn,10))))
  )),
  EFun(Tv,"f",Map("a" -> Ti(32)),EBlock(Tn,List(
      ECall(Tn,EId(Tn,"print_i"),List(EId(Tn,"a"))))
  )),
  EFun(Tv,"main",Map(),EBlock(Tn,List(
      ECall(Tn,EId(Tn,"a"),List(EId(Tn,"f"))))
  ))
))
    test("function pointer local var",
      "def a(n:int) { print_i(n) } def main() { a(10); var ccc:(int)=>void; ccc= a; ccc(20);}",
      null,
      (0, "10\n20\n", ""))

    test("function pointer local var 2",
      "def a(n:int) { print_i(n) } def main() { var ccc= a; ccc(20);}",
      null,
      (0, "20\n", ""))
    test("function pointer local struct",
      "def a(n:int) { print_i(n) } def main() { typedef A = struct {m:(int)=>void}; var a1:A; a1.m= a; a1.m(20);}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct",
      "typedef A = struct {m:(int)=>void} def a(n:int) { print_i(n) } def main() { var a1:A; a1.m= a; a1.m(20);}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 2",
      "typedef A = struct {m:(int)=>void} def a(n:int) { print_i(n) } var a1:A; def main() {  a1.m= a; a1.m(20);}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 3",
      "typedef A = struct {m:(int)=>void} def a(n:int) { print_i(n) } var a1:Ptr[A]; def main() {a1=new A;  a1.m= a; a1.m(20);}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 4",
      "typedef A=struct{m:(int)=>void}def a(n:int){print_i(n)}var a1:Ptr[A]def main(){var a1:A b(&a1)}def b(a1:Ptr[A]){a1.m=a;a1.m(20)}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 5",
      "def main(){b(20)}" +
      "def b(a:int){var a1:int a1=a;print_i(a1)}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 5",
      "def main(){b(20)}" +
      "def b(a:int){var a1:A a1.m=a; print_i(a1.m)}" +
      "typedef A=struct{m:int}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 5",
      "def main(){b(20)}" +
      "def b(a:int){var a1:Ptr[A] = new A; a1.m=a; print_i(a1.m)}" +
      "typedef A=struct{m:int}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 5",
      "def main(){var a1:A b(&a1,a)}" +
      "def b(a1:Ptr[A],a:int){a1.m=a}" +
      "typedef A=struct{m:int}",
      null,
      (0, "20\n", ""))
    test("function pointer global struct 5",
      "def main(){var a1:A b(&a1,a)}" +
      "def b(a1:Ptr[A],a:(int)=>void){a1.m=a a1.m(20)}" +
      "typedef A=struct{m:(int)=>void}" +
      "def a(n:int){print_i(n)}",
      null,
      (0, "20\n", ""))
  }

}