package type7.test
import type7._
object test_double {
  import test._
  def apply() {
    // doubleのテスト
    test("double 10.0を表示",
      "{print_d(10.0)}",
      EBlock(Tv, List(EPrint(Td, ELdd(Td, 10.0)))),
      (0, "10.000000\n", ""))
    test("double 足し算結果表示",
      "{print_d(10.0+20.0)}",
      EPrint(Td, EAdd(Td, ELdd(Td, 10.0), ELdd(Td, 20.0))),
      (0, "30.000000\n", ""))
    test("double 引き算結果表示",
      "{print_d(10.0-20.0)}",
      EPrint(Td, ESub(Td, ELdd(Td, 10.0), ELdd(Td, 20.0))),
      (0, "-10.000000\n", ""))
    test("double 1次元配列",
      "{ var c:double[3]; c[0] = 33.0; print_d(c[0]) }",
      EBlock(Tv, List(
        // double e[3]
        EVar(TArr(Td, 3), "c"),
        // c[1] = 33
        EAssign(Tn, EArray(Td, EId(Tn, "c"), ELd(Ti(64), 1)), ELdd(Td, 33.0)),
        // print(c[1])
        EPrint(Td, EArray(Td, EId(Tn, "c"), ELd(Ti(64), 1))))),
      (0, "33.000000\n", ""))
    test("double 2次元配列",
      "{ var d:double[2][3]; d[0][0] = 44.5; print_d(d[0][0]) }",
      EBlock(Tv, List(
        // int d[2][3];
        EVar(TArr(TArr(Td, 2), 3), "d"),
        // d[0][0] = 44
        EAssign(Tn, EArray(Td, EArray(TArr(Td, 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0)), ELdd(Td, 44.5)),
        // print(d[0][0])
        EPrint(Td, EArray(Td, EArray(TArr(Td, 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0))))),
      (0, "44.500000\n", ""))
    test("double ポインタ演算",
      "{ var a:double; var b:double; var c:double;" +
        "var p:*double; p = &c; a = 12.5; p = p + 2; print_d(p[0]) }",
      EBlock(Tv, List(
        EVar(Td, "a"),
        EVar(Td, "b"),
        EVar(Td, "c"),
        EVar(Tp(Td), "p"),
        EAssign(Tn, EId(Tn, "p"), ERef(Td, EId(Tn, "c"))),
        EAssign(Tn, EId(Tn, "a"), ELdd(Td, 12.5)),
        EAssign(Tn, EId(Tn, "p"), EAdd(Tp(Td), EId(Tn, "p"), ELd(Ti(64), 2))),
        EPrint(Td, EArray(Td, EId(Tn, "p"), ELd(Ti(64), 0))))),
      (0, "12.500000\n", ""))

  }

}