package type7.test
import type7._
object test_long {
  import test._

  def apply() {
    // longテスト
    test("long 10を表示",
      "{print_l(10L)}",
      EBlock(Tv, List(EPrint(Ti(64), ELd(Ti(64), 10)))),
      (0, "10\n", ""))
    test("long 足し算結果表示",
      "{print_l(10L + 20L)}",
      EPrint(Ti(64), EAdd(Ti(64), ELd(Ti(64), 10), ELd(Ti(64), 20))),
      (0, "30\n", ""))
    test("long 引き算結果表示",
      "{print_l(10L - 20L)}",
      EPrint(Ti(64), ESub(Ti(64), ELd(Ti(64), 10), ELd(Ti(64), 20))),
      (0, "-10\n", ""))
    test("long 変数",
      "{ var c:long; c = 333; print_l(c)}",
      EBlock(Tv, List(
        // long c;
        EVar(Ti(64), "c"),
        // c = 333;
        EAssign(Tn, EId(Tn, "c"), ELd(Ti(64), 333)),
        // print(c);
        EPrint(Ti(64), EId(Tn, "c")))),
      (0, "333\n", ""))
    test("long 1次元配列",
      "{ var c:long[3]; c[0] = 333; print_l(c[0])}",
      EBlock(Tv, List(
        // long c[3];
        EVar(TArr(Ti(64), 3), "c"),
        // c[0] = 333;
        EAssign(Ti(64), EArray(Ti(64), EId(Tn, "c"), ELd(Ti(64), 0)), ELd(Ti(64), 333)),
        // print(c[0]);
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "c"), ELd(Ti(64), 0))))),
      (0, "333\n", ""))
    test("long 2次元配列",
      "{ var d:long[2][3]; d[0][0] = 3333; print_l(d[0][0]) }",
      EBlock(Tv, List(
        // 2次元配列
        // long d[2][3];
        EVar(TArr(TArr(Ti(64), 2), 3), "d"),
        // d[0][0] = 333
        EAssign(Tn, EArray(Ti(64), EArray(TArr(Ti(64), 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0)), ELd(Ti(64), 3333)),
        // print(d[0][0])
        EPrint(Ti(64), EArray(Ti(64), EArray(TArr(Ti(64), 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0))))),
      (0, "3333\n", ""));
    test("long ポインタ演算",
      "{ var a:long; var b:long; var c:long; var p:*long; p = &c; a = 12345L; p = p + 2; print_l(p[0]) }",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EVar(Ti(64), "b"),
        EVar(Ti(64), "c"),
        EVar(Tp(Ti(64)), "p"),
        EAssign(Tn, EId(Tn, "p"), ERef(Ti(64), EId(Tn, "c"))),
        EAssign(Tn, EId(Tn, "a"), ELd(Tn, 12345)),
        EAssign(Tn, EId(Tn, "p"), EAdd(Tp(Ti(64)), EId(Tn, "p"), ELd(Ti(64), 2))),
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "p"), ELd(Ti(64), 0))))),
      (0, "12345\n", ""))
    test("long new ポインタ変数",
      "{var a:*long; a = new long[3]; a[1] = 3; print_l(a[1]); a[2] = 3 - 5; print_l(a[2]); print_l(a[1]+a[2]);}",
      EBlock(Tv, List(
        EVar(Tp(Ti(64)), "a"),
        EAssign(Tn, EId(Tn, "a"), ENewArray(Tp(Ti(64)), ELd(Ti(64), 3))), // a = new long[3]
        EAssign(Tn, EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 1)), ELd(Ti(64), 3)), // 1個目に3を代入
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 1))), // 表示する
        // 2個目に3-5 = -2をセット
        EAssign(Tn, EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 2)), ESub(Ti(64), ELd(Ti(64), 3), ELd(Ti(64), 5))),
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 2))),
        // 配列のa[1]+a[2]を表示
        EPrint(Ti(64), EAdd(Ti(64), EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 1)), EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 2)))))),
      (0, "3\n-2\n1\n", ""))

    test("long 配列のポインタ演算",
      "{" +
        "var a:long[3]; var b:long[3]; var c:long[3]; var p:*long[3];" +
        "p = &c; a[1] = 12345; b[1] = 22222;" +
        "p = p + 2; print_l(p[0][1]);" +
        "p = p - 1; print_l(p[0][1]);" +
        "}",
      EBlock(Tv, List(
        EVar(TArr(Ti(64), 3), "a"),
        EVar(TArr(Ti(64), 3), "b"),
        EVar(TArr(Ti(64), 3), "c"),
        EVar(Tp(TArr(Ti(64), 3)), "p"),
        EAssign(Tn, EId(Tn, "p"), ERef(TArr(Ti(64), 3), EId(Tn, "c"))),
        EAssign(Tn, EArray(Ti(64), EId(Tn, "a"), ELd(Ti(64), 1)), ELd(Ti(64), 12345)),
        EAssign(Tn, EArray(Ti(64), EId(Tn, "b"), ELd(Ti(64), 1)), ELd(Ti(64), 22222)),
        EAssign(Tn, EId(Tn, "p"), EAdd(Tp(TArr(Ti(64), 3)), EId(Tn, "p"), ELd(Ti(64), 2))),
        EPrint(Ti(64), EArray(Ti(64), EArray(TArr(Ti(64), 3), EId(Tn, "p"), ELd(Ti(64), 0)), ELd(Ti(64), 1))),
        EAssign(Tn, EId(Tn, "p"), ESub(Tp(TArr(Ti(64), 3)), EId(Tn, "p"), ELd(Ti(64), 1))),
        EPrint(Ti(64), EArray(Ti(64), EArray(TArr(Ti(64), 3), EId(Tn, "p"), ELd(Ti(64), 0)), ELd(Ti(64), 1))))),
      (0, "12345\n22222\n", ""))
  }

}