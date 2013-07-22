package type7.test

import type7._

object test_int {
  import test._

  def apply() {
    // intのテスト
    test("int 10を表示",
      "{print_i(10)}",
      EBlock(Tv,List(EPrint(Ti(32),ELd(Ti(64),10)))),
      (0,"10\n","")
    )
    test("int 足し算結果表示",
      "{print_i(10+20)}",
      EPrint(Ti(32), EAdd(Ti(32), ELd(Ti(64),10), ELd(Ti(64),20))),
      (0, "30\n", "")
    )
    test("int 引き算結果表示",
      "{print_i(10-20)}",
      EPrint(Ti(32), ESub(Ti(32), ELd(Ti(64),10), ELd(Ti(64),20))),
      (0, "-10\n", "")
    )
    test("int 1次元配列",
      "{ var c:int[3]; c[0] = 333333; print_i(c[0]) }",
      EBlock(Tv,List(
        // int e[3]
        EVar(TArr(Ti(32), 3), "c"),
        // c[1] = 333333
        EAssign(Tn,EArray(Ti(32), EId(Tn,"c"), ELd(Ti(64),1)), ELd(Ti(64),333333)),
        // print(c[1])
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"c"), ELd(Ti(64),1))))),
      (0, "333333\n", "")
    )
    test("int 2次元配列",
      "{ var d:int[2][3]; d[0][0] = 444; print_i(d[0][0]) }",
      EBlock(Tv,List(
        // int d[2][3];
        EVar(TArr(TArr(Ti(32), 2), 3), "d"),
        // d[0][0] = 444
        EAssign(Tn,EArray(Ti(32), EArray(TArr(Ti(32), 2), EId(Tn,"d"), ELd(Ti(64),0)), ELd(Ti(64),0)), ELd(Ti(64),444)),
        // print(d[0][0])
        EPrint(Ti(32), EArray(Ti(32), EArray(TArr(Ti(32), 2), EId(Tn,"d"), ELd(Ti(64),0)), ELd(Ti(64),0))))),
      (0, "444\n", "")
    )
    test("int ポインタ演算",
      "{ var a:int; var b:int; var c:int;" +
      "var p:*int; p = &c; a = 12; p = p + 2; print_i(p[0]) }",
      EBlock(Tv,List(
        EVar(Ti(32), "a"),
        EVar(Ti(32), "b"),
        EVar(Ti(32), "c"),
        EVar(Tp(Ti(32)), "p"),
        EAssign(Tn,EId(Tn,"p"), ERef(Ti(32), EId(Tn,"c"))),
        EAssign(Tn,EId(Tn,"a"), ELd(Ti(64),12)),
        EAssign(Tn,EId(Tn,"p"), EAdd(Tp(Ti(32)), EId(Tn,"p"), ELd(Ti(64),2))),
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"p"), ELd(Ti(64),0))))),
      (0, "12\n", "")
    )
    test("intのポインタを適当に変形してみる",
      "{var e:long[3]; var f:*int; f = e; e[0] = "+0x0100000002L+";" +
      " print_l(e[0]); print_i(f[0]); print_i(f[1]);}",
      EBlock(Tv,List(
        // 1次元配列
        // int e[3]
        EVar(TArr(Ti(64), 3), "e"),
        // e[1] = 33
        EAssign(Tn,EArray(Ti(64), EId(Tn,"e"), ELd(Ti(64),0)), ELd(Ti(64),0x0100000002L)),
        // print(e[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn,"e"), ELd(Ti(64),0))),
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"e"), ELd(Ti(64),0))),
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"e"), ELd(Ti(64),1)))
        )),
      (0, 0x0100000002L + "\n2\n1\n", "")
    )
    test("longポインタをintポインタにして計算してみる",
      "{" +
      "var e:long[3]; e[1] = 33; print_l(e[1]);" +
      "var ep:*long;ep = e;print_l(ep[1]);" +
      "var fp:*int; fp = e;"+
      "print_i(fp[2]); print_i(fp[3]);" +
      "fp[3] = 2;" +
      "print_i(fp[3]) ;print_l(ep[1]);"+
      "}",
      EBlock(Tv,List(
        // 1次元配列
        // long e[3]
        EVar(TArr(Ti(64), 3), "e"),
        // e[1] = 33
        EAssign(Tn,EArray(Ti(64), EId(Tn,"e"), ELd(Ti(64),1)), ELd(Ti(64),33)),
        // print(e[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn,"e"), ELd(Ti(64),1))),
        // long* ep;
        EVar(Tp(Ti(64)), "ep"),
        // ep = &e;
        EAssign(Tn,EId(Tn,"ep"), EId(Tn,"e")),
        // print(ep[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn,"ep"), ELd(Ti(64),1))),
        // int* fp;
        EVar(Tp(Ti(32)), "fp"),
        // fp = &e;
        EAssign(Tn,EId(Tn,"fp"), EId(Tn,"e")),
        // print(fp[1])
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"fp"), ELd(Ti(64),2))),
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"fp"), ELd(Ti(64),3))),
        // fp[3] = 1
        EAssign(Tn,EArray(Ti(32), EId(Tn,"fp"), ELd(Ti(64),3)), ELd(Ti(64),2)),
        EPrint(Ti(32), EArray(Ti(32), EId(Tn,"fp"), ELd(Ti(64),3))),
        // print(ep[1])
        EPrint(Ti(64), EArray(Ti(64), EId(Tn,"ep"), ELd(Ti(64),1))))),
      (0, "33\n33\n33\n0\n2\n" + (0x200000000L + 33) + "\n", "")
    )
    test("int 2次元配列",
      "{ var d:Array[Array[int,2],3]; d[0][0] = 444; print_i(d[0][0]) }",
      null,
      (0, "444\n", "")
    )

    test("int ポインタ演算",
      "{ var a:int; var b:int; var c:int;" +
      "var p:Ptr[int]; p = &c; a = 12; p = p + 2; print_i(p[0]) }",
      null,
      (0, "12\n", "")
    )

    test("longポインタをintポインタにして計算してみる",
      "{" +
      "var e:Array[long,3]; e[1] = 33; print_l(e[1]);" +
      "var ep:Ptr[long];ep = e;print_l(ep[1]);" +
      "var fp:Ptr[int]; fp = e;"+
      "print_i(fp[2]); print_i(fp[3]);" +
      "fp[3] = 2;" +
      "print_i(fp[3]) ;print_l(ep[1]);"+
      "}",
      null,
      (0, "33\n33\n33\n0\n2\n" + (0x200000000L + 33) + "\n", "")
    )
    
  }  
}