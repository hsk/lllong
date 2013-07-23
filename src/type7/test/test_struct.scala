package type7.test
import type7._
import scala.collection.immutable.ListMap

object test_struct extends TestCase {
  import test._

  def apply() {
        // 構造体
    val TStC = TStr(ListMap("c" -> Ti(64)))
    val TStB = TStr(ListMap("a" -> Ti(8), "b" -> TStC))
    val TPoint = TStr(ListMap("x" -> Ti(8), "y" -> Ti(8)))
    val TSt1 = TStr(ListMap("x" -> Ti(8), "a" -> TArr(Ti(8), 3), "y" -> Ti(8)))

    test("構造体",
      "{" +
      "var b:struct{a:byte;b:struct{c:byte}};" +
      "b.a = 3; print_b(b.a); b.b.c = 33; print_b(b.b.c);" +
      "}",
      EBlock(Tv,List(
        // 構造体を宣言 var b:struct{a:byte, b:struct{c:byte}}
        EVar(TStB, "b"),
        // b.a = 3
        EAssign(Tn,EField(Tn,TStB, EId(Tn,"b"), "a"), ELd(Ti(64),3)),
        // print(b.a)
        EPrint(Ti(8), EField(Tn,TStB, EId(Tn,"b"), "a")),
        // b.b.c = 33
        EAssign(Tn,EField(Tn,TStC, EField(Tn,TStB, EId(Tn,"b"), "b"), "c"), ELd(Ti(64),33)),
        // print(b.b.c)
        EPrint(Ti(64), EField(Tn,TStC, EField(Tn,TStB, EId(Tn,"b"), "b"), "c")))),
      (0, "3\n33\n", "")
    )
//throw new Exception("e")
   /* 
    test("リスト構造",
      "{" +
//      "var i = 111; print_l(i);" +
      " typedef List = struct{data:byte; next:*List}" +
//      "var b:*List;" +
//      "b = new List;" +
      "var a:List;" +
      "a.data = 111;" +
      "a.next = new List;" +
      "a.next->data = 44;" +
//      "var b:struct{a:byte;b:struct{c:byte}};" +
//      "b.a = 3; print_b(b.a); b.b.c = 33; print_b(b.b.c);" +
      "print_b(a.data);" +
      "print_b(a.next->data);" +
      "}",
      null,
      (0, "111\n44\n", "")
    )
*/    
    test("構造体の配列",
      "{" +
      "var b:struct{x:byte; y:byte;}[3];" +
      "b[0].x = 2; b[0].y = 3; b[1].x = 4; b[1].y = 5;" +
      "print_b(b[0].x); print_b(b[0].y); print_b(b[1].x); print_b(b[1].y);" +
      "}",
      EBlock(Tv,List(
        // 構造体の配列を宣言 var b:struct{x:byte;y:byte}[3]
        EVar(TArr(TPoint, 3), "b"),
        // b[0].x=2
        EAssign(Tn,EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),0)), "x"), ELd(Ti(64),2)),
        // b[0].y=3
        EAssign(Tn,EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),0)), "y"), ELd(Ti(64),3)),
        // b[1].x=4
        EAssign(Tn,EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),1)), "x"), ELd(Ti(64),4)),
        // b[1].y=5
        EAssign(Tn,EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),1)), "y"), ELd(Ti(64),5)),
        // print_i(b[0].x)
        EPrint(Ti(8), EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),0)), "x")),
        // print_i(b[0].y)
        EPrint(Ti(8), EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),0)), "y")),
        // print_i(b[1].x)
        EPrint(Ti(8), EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),1)), "x")),
        // print_i(b[1].y)
        EPrint(Ti(8), EField(Tn,TPoint, EArray(TPoint, EId(Tn,"b"), ELd(Ti(64),1)), "y")))),
      (0, "2\n3\n4\n5\n", "")
    )
    test("構造体内の配列",
      "{" +
      "var b:struct{x:byte; a:byte[3]; y:byte}" +
      "b.x=1;b.y=2;b.a[0]=11;b.a[1]=22;b.a[2]=33;" +
      "print_b(b.x); print_b(b.y);" +
      "print_b(b.a[0]); print_b(b.a[1]); print_b(b.a[2]);print_b(b.a[3]);" +
      "b.a[3]=55; print_b(b.y); print_b(b.a[3]);" +
      "b.a[-1] = 100; print_b(b.x); print_b(b.a[-1]);" +
      "}",
      EBlock(Tv,List(
        EVar(TArr(TSt1, 3), "b"),
        // b.x=10
        EAssign(Tn,EField(Tn,TSt1, EId(Tn,"b"), "x"), ELd(Ti(64),1)),
        // b.y=20
        EAssign(Tn,EField(Tn,TSt1, EId(Tn,"b"), "y"), ELd(Ti(64),2)),
        // b.a[0]=2
        EAssign(Tn,EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),0)), ELd(Ti(64),11)),
        // b.a[1]=3
        EAssign(Tn,EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),1)), ELd(Ti(64),22)),
        // b.a[2]=4
        EAssign(Tn,EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),2)), ELd(Ti(64),33)),
        // print_b(b.x)
        EPrint(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "x")),
        // print_b(b.y)
        EPrint(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "y")),
        // print_b(b.a[0])
        EPrint(Ti(8), EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),0))),
        // print_b(b.a[1])
        EPrint(Ti(8), EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),1))),
        // print_b(b.a[2])
        EPrint(Ti(8), EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),2))),
        // print_b(b.a[3])
        EPrint(Ti(8), EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),3))),
        // b.a[3]=55
        EAssign(Tn,EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),3)), ELd(Ti(64),55)),
        // print_b(b.y)
        EPrint(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "y")),
        // print_b(b.a[3])
        EPrint(Ti(8), EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),3))),
        // b.a[-1]=100
        EAssign(Tn,EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),-1)), ELd(Ti(64),100)),
        // print_b(b.x)
        EPrint(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "x")),
        // print_b(b.a[-1])
        EPrint(Ti(8), EArray(Ti(8), EField(Tn,TSt1, EId(Tn,"b"), "a"), ELd(Ti(64),-1))))),
      (0, "1\n2\n11\n22\n33\n2\n55\n55\n100\n100\n", "")
    )
    test("構造体のポインタ演算",
      "{" +
      "var a:struct{x:byte; y:byte;};" +
      "var b:struct{x:byte; y:byte;};" +
      "var c:struct{x:byte; y:byte;};" +
      "var p:*(struct{x:byte; y:byte;} );" +
      "p= &c;" +
      "a.x=12;" +
      "c.x=111;" +
      "p=p+8;" +
      "print_b(p->x);" +
      "}",
      EBlock(Tv,List(
        EVar(TPoint, "a"),
        EVar(TPoint, "b"),
        EVar(TPoint, "c"),
        EVar(Tp(TPoint), "p"),
        EAssign(Tn,EId(Tn,"p"), ERef(TPoint, EId(Tn,"c"))),
        EAssign(Tn,EField(Tn,TPoint, EId(Tn,"a"), "x"), ELd(Ti(64),12)),
        EAssign(Tn,EId(Tn,"p"), EAdd(Tp(TPoint), EId(Tn,"p"), ELd(Ti(64),2))),
        EPrint(Ti(8), EField(Tn,TPoint, EPtr(TPoint, EId(Tn,"p")), "x")))),
      (0, "12\n", "")
    )

    test("構造体のポインタ演算",
      "{" +
      " typedef ABC = struct{x:int y:int} "+
      " var a = new ABC" +
      " a.x = 10" +
      " print_i(a.x)" +
      "}",
      null,
      (0, "10\n", "")
    )

    test("構造体のポインタ演算",
      "{" +
      " typedef ABC = struct{x:int y:int} "+
      " var a = new ABC" +
      " a.x = 10" +
      " print_i(a->x)" +
      "}",
      null,
      (0, "10\n", "")
    )
    
    test("構造体のポインタ演算",
      "{" +
      " typedef ABC1 = struct{x:int y:int} "+
      " typedef ABC = struct{x:int y:int z:Ptr[ABC1]} "+
      " var a = new ABC" +
      " a.x = 10" +
      " a.z = new ABC1" +
      " a.z.x=5" +
      " a.z.y=6" +
      " print_i(a.x)" +
      " print_i(a.z.x)" +
      " print_i(a.z.y)" +
      "}",
      null,
      (0, "10\n5\n6\n", "")
    )
  }

}