package type7.test
import type7._

object test_short {
  import test._

  def apply() {
    // shortのテスト
    test("short 10を表示",
      "{print_s(10)}",
      EBlock(Tv, List(EPrint(Ti(16), ELd(Ti(64), 10)))),
      (0, "10\n", ""))
    test("short 足し算結果表示",
      "{print_s(10+20)}",
      EPrint(Ti(16), EAdd(Ti(16), ELd(Ti(64), 10), ELd(Ti(64), 20))),
      (0, "30\n", ""))
    test("short 引き算結果表示",
      "{print_s(10-20)}",
      EPrint(Ti(16), ESub(Ti(16), ELd(Ti(64), 10), ELd(Ti(64), 20))),
      (0, "-10\n", ""))
    test("int 1次元配列",
      "{ var c:short[3]; c[0] = 3333; print_s(c[0]) }",
      EBlock(Tv, List(
        // int e[3]
        EVar(TArr(Ti(16), 3), "c"),
        // c[1] = 33
        EAssign(Tn, EArray(Ti(16), EId(Tn, "c"), ELd(Ti(64), 1)), ELd(Ti(64), 3333)),
        // print(c[1])
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "c"), ELd(Ti(64), 1))))),
      (0, "3333\n", ""))
    test("short 2次元配列",
      "{ var d:short[2][3]; d[0][0] = 444; print_s(d[0][0]) }",
      EBlock(Tv, List(
        // int d[2][3];
        EVar(TArr(TArr(Ti(16), 2), 3), "d"),
        // d[0][0] = 444
        EAssign(Tn, EArray(Ti(16), EArray(TArr(Ti(16), 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0)), ELd(Ti(64), 444)),
        // print(d[0][0])
        EPrint(Ti(16), EArray(Ti(16), EArray(TArr(Ti(16), 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0))))),
      (0, "444\n", ""))
    test("short ポインタ演算",
      "{ var a:short; var b:short; var c:short;" +
        "var p:*short; p = &c; a = 12; p = p + 2; print_s(p[0]) }",
      EBlock(Tv, List(
        EVar(Ti(16), "a"),
        EVar(Ti(16), "b"),
        EVar(Ti(16), "c"),
        EVar(Tp(Ti(16)), "p"),
        EAssign(Tn, EId(Tn, "p"), ERef(Ti(16), EId(Tn, "c"))),
        EAssign(Tn, EId(Tn, "a"), ELd(Ti(64), 12)),
        EAssign(Tn, EId(Tn, "p"), EAdd(Tp(Ti(16)), EId(Tn, "p"), ELd(Ti(64), 2))),
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "p"), ELd(Ti(64), 0))))),
      (0, "12\n", ""))
    test("shortのポインタを適当に変形してみる",
      "{var e:long[3]; var f:*short; f = e; e[0] = " + 0x010002 + ";" +
        " print_l(e[0]); print_s(f[0]); print_s(f[1]);}",
      EBlock(Tv, List(
        // 1次元配列
        // long e[3]
        EVar(TArr(Ti(64), 3), "e"),
        EVar(Tp(Ti(16)), "f"),
        EAssign(Tn, EId(Tn, "f"), EId(Tn, "e")),
        // e[0] = 0x010002
        EAssign(Tn, EArray(Ti(64), EId(Tn, "e"), ELd(Ti(64), 0)), ELd(Ti(64), 0x010002L)),
        // print(e[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "e"), ELd(Ti(64), 0))),
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "f"), ELd(Ti(64), 0))),
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "f"), ELd(Ti(64), 1))))),
      (0, 0x010002L + "\n2\n1\n", ""))
    test("longポインタをshortポインタにして計算してみる",
      "{" +
        "var e:long[3]; e[1] = 33; print_l(e[1]);" +
        "var ep:*long;ep = e;print_l(ep[1]);" +
        "var fp:*short; fp = e;" +
        "print_s(fp[4]); print_s(fp[6]);" +
        "fp[6] = 2;" +
        "print_s(fp[6]) ;print_l(ep[1]);" +
        "}",
      EBlock(Tv, List(
        // 1次元配列
        // long e[3]
        EVar(TArr(Ti(64), 3), "e"),
        // e[1] = 33
        EAssign(Tn, EArray(Ti(64), EId(Tn, "e"), ELd(Ti(64), 1)), ELd(Ti(64), 33)),
        // print(e[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "e"), ELd(Ti(64), 1))),
        // long* ep;
        EVar(Tp(Ti(64)), "ep"),
        // ep = &e;
        EAssign(Tn, EId(Tn, "ep"), EId(Tn, "e")),
        // print(ep[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "ep"), ELd(Ti(64), 1))),
        // short* fp;
        EVar(Tp(Ti(16)), "fp"),
        // fp = &e;
        EAssign(Tn, EId(Tn, "fp"), EId(Tn, "e")),
        // print(fp[1])
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "fp"), ELd(Ti(64), 2 * 2))),
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "fp"), ELd(Ti(64), 3 * 2))),
        // fp[3] = 1
        EAssign(Tn, EArray(Ti(16), EId(Tn, "fp"), ELd(Ti(64), 3 * 2)), ELd(Ti(64), 2)),
        EPrint(Ti(16), EArray(Ti(16), EId(Tn, "fp"), ELd(Ti(64), 3 * 2))),
        // print(ep[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "ep"), ELd(Ti(64), 1))))),
      (0, "33\n33\n33\n0\n2\n" + (0x200000000L + 33) + "\n", ""))

  }

}