package type7.test
import type7._
object test_float {
  import test._
  def apply() {
    // floatのテスト
    test("float 10.0を表示",
      "{print_f(10.0)}",
      EBlock(Tv, List(EPrint(Tf, ELdd(Td, 10.0)))),
      (0, "10.000000\n", ""))
    test("float 変数",
      "{ var a:float; a=11.1; print_f(a)}",
      EBlock(Tv, List(
        EVar(Tf, "a"),
        EAssign(Tn, EId(Tn, "a"), ELdd(Td, 11.1)),
        EPrint(Tf, EId(Tn, "a")))),
      (0, "11.100000\n", ""))
    test("float 足し算結果表示",
      "{print_f(10.0+20.0)}",
      EPrint(Tf, EAdd(Tf, ELdd(Td, 10.0), ELdd(Td, 20.0))),
      (0, "30.000000\n", ""))
    test("float 引き算結果表示",
      "{print_f(10.0-20.0)}",
      EPrint(Tf, ESub(Tf, ELdd(Td, 10.0), ELdd(Td, 20.0))),
      (0, "-10.000000\n", ""))
    test("float 1次元配列",
      "{ var c:float[3]; c[0] = 33.0; print_f(c[0]) }",
      EBlock(Tv, List(
        // float e[3]
        EVar(TArr(Tf, 3), "c"),
        // c[1] = 33
        EAssign(Tn, EArray(Tf, EId(Tn, "c"), ELd(Ti(64), 1)), ELdd(Td, 33.0)),
        // print(c[1])
        EPrint(Tf, EArray(Tf, EId(Tn, "c"), ELd(Ti(64), 1))))),
      (0, "33.000000\n", ""))
    test("float 2次元配列",
      "{ var d:float[2][3]; d[0][0] = 44.5; print_f(d[0][0]) }",
      EBlock(Tv, List(
        // int d[2][3];
        EVar(TArr(TArr(Tf, 2), 3), "d"),
        // d[0][0] = 44
        EAssign(Tn, EArray(Tf, EArray(TArr(Tf, 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0)), ELdd(Td, 44.5)),
        // print(d[0][0])
        EPrint(Tf, EArray(Tf, EArray(TArr(Tf, 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0))))),
      (0, "44.500000\n", ""))
    test("float ポインタ演算",
      "{ var a:float; var b:float; var c:float;" +
        "var p:*float; p = &c; a = 12.5; p = p + 2; print_f(p[0]) }",
      EBlock(Tv, List(
        EVar(Tf, "a"),
        EVar(Tf, "b"),
        EVar(Tf, "c"),
        EVar(Tp(Tf), "p"),
        EAssign(Tn, EId(Tn, "p"), ERef(Tf, EId(Tn, "c"))),
        EAssign(Tn, EId(Tn, "a"), ELdd(Td, 12.5)),
        EAssign(Tn, EId(Tn, "p"), EAdd(Tp(Tf), EId(Tn, "p"), ELd(Ti(64), 2))),
        EPrint(Tf, EArray(Tf, EId(Tn, "p"), ELd(Ti(64), 0))))),
      (0, "12.500000\n", ""))
    test("float 比較",
      "{ var a:float = 1.0" +
        "print_l(a < 1.2) }",
      null,
      (0, "1\n", ""))

  }

}