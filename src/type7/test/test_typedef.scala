package type7.test
import type7._
import scala.collection.immutable.ListMap

object test_typedef {
  import test._

  def apply() {
    // typedefのテスト
    test("longのtypedef",
      "{typedef mylong=long; print_l(12);}",
      EBlock(Tv,List(
          ETypeDef(Ti(64), "mylong"),
          EPrint(Ti(64), ELd(Ti(64),12))
        )),
      (0, "12\n", "")
    )
    test("typedef long 1次元配列",
      "{typedef mylong=long[1]; var c:mylong; c[0]=333; print_l(c[0]);}",
      EBlock(Tv,List(
        ETypeDef(TArr(Ti(64),3), "mylong"),
        // long c[3];
        EVar(TDef("mylong"), "c"),
        // c[0] = 333;
        EAssign(Tn,EArray(Ti(64), EId(Tn,"c"), ELd(Ti(64),0)), ELd(Ti(64),333)),
        // print(c[0]);
        EPrint(Ti(64), EArray(Ti(64), EId(Tn,"c"), ELd(Ti(64),0))))),
      (0, "333\n", "")
    )
    test("typedef long 1次元配列",
      "{typedef mylong=long; typedef la3 = mylong[3]; var c:la3; c[0]=333;print_l(cast(long)(*c));}",
      EBlock(Tv,List(
        ETypeDef(Ti(64), "mylong"),
        ETypeDef(TArr(TDef("mylong"), 3), "la3"),
        // long c[3];
        EVar(TDef("la3"), "c"),
        // c[0] = 333;
        EAssign(Tn,EArray(TDef("mylong"), EId(Tn,"c"), ELd(Ti(64),0)), ELd(Ti(64),333)),
        // print(*c);
        EPrint(Ti(64), EPtr(TDef("mylong"), EId(Tn,"c"))))),
      (0, "333\n", "")
    )
    val TPoint = TStr(ListMap("x" -> Ti(8), "y" -> Ti(8)))
    test("構造体のtypedef",
      "{" +
      "typedef POINT=struct{x:int; y:int}" +
      "var a:POINT; var b:POINT; var c:POINT;" +
      "var p:*POINT; p= &c; a.x = 12; p = p + 2; print_i(p->x);" +
      "}",
      EBlock(Tv,List(
        ETypeDef(TPoint, "POINT"),
        EVar(TDef("POINT"), "a"),
        EVar(TDef("POINT"), "b"),
        EVar(TDef("POINT"), "c"),
        EVar(Tp(TDef("POINT")), "p"),
        EAssign(Tn,EId(Tn,"p"), ERef(TDef("POINT"), EId(Tn,"c"))),
        EAssign(Tn,EField(Tn,TDef("POINT"), EId(Tn,"a"), "x"), ELd(Ti(64),12)),
        EAssign(Tn,EId(Tn,"p"), EAdd(Tp(TDef("POINT")), EId(Tn,"p"), ELd(Ti(64),2))),
        EPrint(Ti(8), EField(Tn,TDef("POINT"), EPtr(TDef("POINT"), EId(Tn,"p")), "x")))),
      (0, "12\n", "")
    )
    test("リスト構造",
      "{" +
      " typedef List = struct{data:byte; next:*List}" +
      " var b:*List;" +
      "b = new List;" +
      "var a:List;" +
      "a.data = 111;" +
      "a.next = new List;" +
      "a.next->data = 44;" +
      "print_b(a.data);" +
      "print_b(a.next->data);" +
      "}",
/*      EBlock(Tv,List(
        ETypeDef(TStr(Map("data" -> Ti(8), "next" -> Tp(TDef("List")))), "List"),
        EVar(Tp(TDef("List")), "b"),
        EAssign(Tn,EId(Tn,"b"),ENew(TDef("List"))),
        EVar(TDef("List"), "a"),
        // a.data = 111;
        EAssign(Tn,EField(Tn,TDef("List"),EId(Tn,"a"),"data"),ELd(Ti(64),111)),
        // a.next = new List();
        EAssign(Tn,EField(Tn,TDef("List"), EId(Tn,"a"), "next"), ENew(TDef("List"))),
        // a.next->data = 44;
        EAssign(Tn,
            EArrow(Tn, TDef("List"),EField(Tn,TDef("List"), EId(Tn,"a"), "next"),"data"),
            ELd(Ti(64),44)
        ),
        // print(a.data)
        EPrint(Ti(8), EField(Tn,TDef("List"), EId(Tn,"a"), "data")),
        // print(a.next->data)
        EPrint(Ti(8),
          EArrow(Tn, TDef("List"), EField(Tn,TDef("List"), EId(Tn,"a"), "next"), "data")
        )
      )),*/
      null,
      (0, "111\n44\n", "")
    )
  }

}