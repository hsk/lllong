package type7.test
import type7._
object test_if {
  import test._

  def apply() {

    test("if(1)",
      "{var a:long; a = 1; if(a)print_l(1)}",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EAssign(Ti(64), EId(Ti(64),"a"), ELd(Ti(64),1)),
        EIf(Tn, EId(Ti(64),"a"),EPrint(Ti(64), ELd(Ti(64), 1)),ENop(Tn,"")))),
      (0, "1\n", ""))

    test("if(0)",
      "{var a:long; a = 0; if(a)print_l(1)}",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EAssign(Ti(64), EId(Ti(64),"a"), ELd(Ti(64),0)),
        EIf(Tn, EId(Ti(64),"a"),EPrint(Ti(64), ELd(Ti(64), 1)),ENop(Tn,"")))),
      (0, "", ""))

    test("if(1)",
      "{var a:long; a = 1; if(a)print_l(1)}",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EAssign(Ti(64), EId(Ti(64),"a"), ELd(Ti(64),1)),
        EIf(Tn, EId(Ti(64),"a"),EPrint(Ti(64), ELd(Ti(64), 1)),ENop(Tn,"")))),
      (0, "1\n", ""))

    test("if (0) print_i(1) else print_i(2)",
      "{var a:long; a = 0; if (a) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EAssign(Ti(64), EId(Ti(64),"a"), ELd(Ti(64),0)),
        EIf(Tn, EId(Ti(64),"a"),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "2\n", ""))

    test("if (0) print_i(1) else if (0) print_i(2) else print_i(3)",
      "{if (0) print_i(1) else if (0) print_i(2) else print_i(3)}",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EAssign(Ti(64), EId(Ti(64),"a"), ELd(Ti(64),0)),
        EIf(Tn, ELd(Ti(64),0), EPrint(Ti(64), ELd(Ti(64), 1)),
            EIf(Tn, ELd(Ti(64),0),EPrint(Ti(64), ELd(Ti(64), 2)),EPrint(Ti(64), ELd(Ti(64), 3))))
      )),
      (0, "3\n", ""))

      
     test("if (0) print_i(1) else if (1) print_i(2) else print_i(3)",
      "{if (0) print_i(1) else if (1) print_i(2) else print_i(3)}",
      EBlock(Tv, List(
        EVar(Ti(64), "a"),
        EAssign(Ti(64), EId(Ti(64),"a"), ELd(Ti(64),0)),
        EIf(Tn, ELd(Ti(64),0), EPrint(Ti(64), ELd(Ti(64), 1)),
            EIf(Tn, ELd(Ti(64),1),EPrint(Ti(64), ELd(Ti(64), 2)),EPrint(Ti(64), ELd(Ti(64), 3))))
      )),
      (0, "2\n", ""))

    test("if (0) print_i(1) else print_i(2)",
      "{if (!0) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, ENot(Ti(64),ELd(Ti(64),0)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "1\n", ""))

    test("if (10 <= 20) print_i(1) else print_i(2)",
      "{if (10 <= 20) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, ELe(Ti(64),ELd(Ti(64),10),ELd(Ti(64),20)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "1\n", ""))
    test("if (20 <= 10) print_i(1) else print_i(2)",
      "{if (20 <= 10) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, ELe(Ti(64),ELd(Ti(64),20),ELd(Ti(64),10)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "2\n", ""))
    test("if (10 < 20) print_i(1) else print_i(2)",
      "{if (10 < 20) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, ELt(Ti(64),ELd(Ti(64),10),ELd(Ti(64),20)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "1\n", ""))
    test("if (20 < 10) print_i(1) else print_i(2)",
      "{if (20 < 10) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, ELt(Ti(64),ELd(Ti(64),20),ELd(Ti(64),10)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "2\n", ""))
    test("if (10 >= 20) print_i(1) else print_i(2)",
      "{if (10 >= 20) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, EGe(Ti(64),ELd(Ti(64),10),ELd(Ti(64),20)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "2\n", ""))
  
    test("if (10 > 20) print_i(1) else print_i(2)",
      "{if (10 > 20) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, EGt(Ti(64),ELd(Ti(64),10),ELd(Ti(64),20)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "2\n", ""))
  
    test("if (10 != 20) print_i(1) else print_i(2)",
      "{if (10 != 20) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, ENe(Ti(64),ELd(Ti(64),10),ELd(Ti(64),20)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "1\n", ""))
    test("if (10 == 20) print_i(1) else print_i(2)",
      "{if (10 == 20) print_i(1) else print_i(2)}",
      EBlock(Tv, List(
        EIf(Tn, EEq(Ti(64),ELd(Ti(64),10),ELd(Ti(64),20)),EPrint(Ti(64), ELd(Ti(64), 1)),EPrint(Ti(64), ELd(Ti(64), 2))))),
      (0, "2\n", ""))

  
    test("var a:long a = 0 while(a < 10) { a += 1; print_l(a) }",
      "{var a:long a = 0 while(a < 3) { a = a + 1; print_l(a) }}",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 1)),
        EPrint(Ti(64), ELd(Ti(64), 2)),
        EPrint(Ti(64), ELd(Ti(64), 3))
        )),
      (0, "1\n2\n3\n", ""))

    test("var a:long a = 0 do { a += 1; print_l(a) } while (a < 3); ",
      "{var a:long a = 0 do { a = a + 1; print_l(a) } while(a < 3); }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 1)),
        EPrint(Ti(64), ELd(Ti(64), 2)),
        EPrint(Ti(64), ELd(Ti(64), 3))
        )),
      (0, "1\n2\n3\n", ""))
      
    test("var a:long a = 0 goto bbb; a = 1; bbb: print_l(a) ",
      "{var a:long a = 0 goto bbb; a = 1; bbb: print_l(a) }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 0))
        )),
      (0, "0\n", ""))
    test("for({var a:long a = 1};a <= 3; a++) print_l(a) ",
      "{var a:long;for(a = 0;a < 3; a = a + 1) print_l(a) }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 0)),
        EPrint(Ti(64), ELd(Ti(64), 1)),
        EPrint(Ti(64), ELd(Ti(64), 2))
        )),
      (0, "0\n1\n2\n", ""))
    test("switch(0) {case 1: print_l(1); default: print_l(0) } ",
      "{switch(0) {case 1: print_l(1); default: print_l(0) } }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 0))
        )),
      (0, "0\n", ""))
    test("switch(1) {case 1: print_l(1); default: print_l(0) } ",
      "{switch(1) {case 1: print_l(1); default: print_l(0) } }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 1)),
        EPrint(Ti(64), ELd(Ti(64), 0))
        )),
      (0, "1\n0\n", ""))
    test("switch(1) {case 1: print_l(1); break; default: print_l(0) } ",
      "{switch(1) {case 1: print_l(1); break; default: print_l(0) } }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 1))
        )),
      (0, "1\n", ""))
    test("switch(2)",
      "{switch(2) {case 1: print_l(1); break; case 2: print_l(2); break;default: print_l(0) } }",
      null,
      (0, "2\n", ""))
    test("switch(2)",
      "{2 is {1? print_l(1); break; 2? print_l(2); break;_? print_l(0) } }",
      null,
      (0, "2\n", ""))
    test("while(1) {print_l(1); break; } ",
      "{while(1) {print_l(1); break; }  }",
      EBlock(Tv, List(
        EPrint(Ti(64), ELd(Ti(64), 1))
        )),
      (0, "1\n", ""))
  }

}