package type7.test
import type7._
object test_byte {
  import test._

  def apply() {
    // byteのテスト
    test("byte 10を表示",
      "{\nprint_b(10L)\n}",
      null,
//      EBlock(Tv, List(EPrint(Ti(8), ELd(Ti(64), 10)))),
      (0, "10\n", ""))
    test("byte 足し算結果表示",
      "{print_b(10 + 20)}",
      EPrint(Ti(8), EAdd(Ti(8), ELd(Ti(64), 10), ELd(Ti(64), 20))),
      (0, "30\n", ""))
    test("byte 引き算結果表示",
      "{print_b(10 - 20)}",
      EPrint(Ti(8), ESub(Ti(8), ELd(Ti(64), 10), ELd(Ti(64), 20))),
      (0, "-10\n", ""))
    test("byte 1次元配列",
      "{ var c:byte[3]; c[1] = 33; print_b(c[1])}",
      EBlock(Tv, List(
        // byte e[3]
        EVar(TArr(Ti(8), 3), "c"),
        // c[1] = 33
        EAssign(Tn, EArray(Ti(8), EId(Tn, "c"), ELd(Ti(64), 1)), ELd(Ti(64), 33)),
        // print(c[1])
        EPrint(Ti(64), EArray(Ti(8), EId(Tn, "c"), ELd(Ti(64), 1))))),
      (0, "33\n", ""))
    test("byte 2次元配列",
      "{ var d:byte[2][3]; d[0][0] = 44; print_b(d[0][0]) }",
      EBlock(Tv, List(
        // byte d[2][3];
        EVar(TArr(TArr(Ti(8), 2), 3), "d"),
        // d[0][0] = 44
        EAssign(Tn, EArray(Ti(8), EArray(TArr(Ti(8), 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0)), ELd(Ti(64), 44)),
        // print(d[0][0])
        EPrint(Ti(64), EArray(Ti(8), EArray(TArr(Ti(8), 2), EId(Tn, "d"), ELd(Ti(64), 0)), ELd(Ti(64), 0))))),
      (0, "44\n", ""))
    test("byte ポインタ演算",
      "{ var a:byte; var b:byte; var c:byte; var p:*byte; p = &c; a = 12; p = p + 2; print_b(p[0]) }",
      EBlock(Tv, List(
        EVar(Ti(8), "a"),
        EVar(Ti(8), "b"),
        EVar(Ti(8), "c"),
        EVar(Tp(Ti(8)), "p"),
        EAssign(Tn, EId(Tn, "p"), ERef(Ti(8), EId(Tn, "c"))),
        EAssign(Tn, EId(Tn, "a"), ELd(Ti(64), 12)),
        EAssign(Tn, EId(Tn, "p"), EAdd(Tp(Ti(8)), EId(Tn, "p"), ELd(Ti(64), 2))),
        EPrint(Ti(8), EArray(Ti(8), EId(Tn, "p"), ELd(Ti(64), 0))))),
      (0, "12\n", ""))
    test("byteのポインタを適当に変形してみる",
      "{var e:long[3]; e[0] = 258; var f:*byte; f = e; print_l(e[0]); print_b(f[0]); print_b(f[1]);}",
      EBlock(Tv, List(
        // 1次元配列
        // int e[3]
        EVar(TArr(Ti(64), 3), "e"),
        EVar(Tp(Ti(8)), "f"),
        // e[1] = 33
        EAssign(Tn, EArray(Ti(64), EId(Tn, "e"), ELd(Ti(64), 0)), ELd(Ti(64), 0x0102L)),
        EAssign(Tn, EId(Tn, "f"), ERef(Ti(8), EId(Tn, "e"))),
        // print(e[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "e"), ELd(Ti(64), 0))),
        EPrint(Ti(8), EArray(Ti(8), EId(Tn, "f"), ELd(Ti(64), 0))),
        EPrint(Ti(8), EArray(Ti(8), EId(Tn, "f"), ELd(Ti(64), 1))))),
      (0, 0x0102L + "\n2\n1\n", ""))
    test("longポインタをbyteポインタにして計算してみる",
      "{" +
        "var e:long[3]; e[1] = 33; print_l(e[1]);" +
        "var ep:*long;ep = e;print_l(ep[1]);" +
        "var fp:*byte; fp = e;" +
        "print_b(fp[8]); print_b(fp[12]);" +
        "fp[12] = 2;" +
        "print_b(fp[12]) ;print_l(ep[1]);" +
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
        // ep = e;
        EAssign(Tn, EId(Tn, "ep"), EId(Tn, "e")),
        // print(ep[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "ep"), ELd(Ti(64), 1))),
        // byte* fp;
        EVar(Tp(Ti(8)), "fp"),
        // fp = e;
        EAssign(Tn, EId(Tn, "fp"), EId(Tn, "e")),
        // print(fp[1])
        EPrint(Ti(8), EArray(Ti(8), EId(Tn, "fp"), ELd(Ti(64), 2 * 4))),
        EPrint(Ti(8), EArray(Ti(8), EId(Tn, "fp"), ELd(Ti(64), 3 * 4))),
        // fp[3] = 1
        EAssign(Tn, EArray(Ti(8), EId(Tn, "fp"), ELd(Ti(64), 3 * 4)), ELd(Ti(64), 2)),
        EPrint(Ti(8), EArray(Ti(8), EId(Tn, "fp"), ELd(Ti(64), 3 * 4))),
        // print(ep[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn, "ep"), ELd(Ti(64), 1))))),
      (0, "33\n33\n33\n0\n2\n" + (0x200000000L + 33) + "\n", ""))

  }

}