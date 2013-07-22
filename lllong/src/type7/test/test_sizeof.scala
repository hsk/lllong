package type7.test
import type7._

object test_sizeof {
  import test._

  def apply() {
    test("sizeof(1)",
      "{print_l(sizeof(1))}",
      EBlock(Tv, List(EPrint(Ti(64),ESizeOf(Ti(64),Ti(64),null)))),
      (0, "8\n", ""))

    test("sizeof(int)",
      "{print_l(sizeof(int))}",
      EBlock(Tv, List(EPrint(Ti(64),ESizeOf(Ti(64),Ti(32),null)))),
      (0, "4\n", ""))

    test("sizeof(a:int)",
      "{var a:int print_l(sizeof(a))}",
      EBlock(Tv, List(EPrint(Ti(64),ESizeOf(Ti(64),Ti(32),null)))),
      (0, "4\n", ""))

      test("sizeof(a:*int)",
      "{var a:*int print_l(sizeof(a))}",
      null,
      (0, "8\n", ""))

      test("sizeof(a:byte)",
      "{var a:byte print_l(sizeof(a))}",
      EBlock(Tv, List(EPrint(Ti(64),ESizeOf(Ti(64),Ti(8),null)))),
      (0, "1\n", ""))

      test("sizeof(a:short)",
      "{var a:short print_l(sizeof(a))}",
      EBlock(Tv, List(EPrint(Ti(64),ESizeOf(Ti(64),Ti(16),null)))),
      (0, "2\n", ""))

      test("sizeof(a:short[10])",
      "{var a:short[10] print_l(sizeof(a))}",
      EBlock(Tv, List(EPrint(Ti(64),ESizeOf(Ti(64),TArr(Ti(16),10),null)))),
      (0, "20\n", ""))

      test("sizeof(struct)",
      "{typedef A = struct {a:int;b:byte} var a:A print_l(sizeof(a))}",
      null,
      (0, "5\n", ""))

      test("sizeof(struct)",
      "{typedef A = struct {a:int;b:byte} print_l(sizeof(A))}",
      null,
      (0, "5\n", ""))
  
      test("sizeof(struct)",
      "{print_l(sizeof(struct{a:int;b:byte}))}",
      null,
      (0, "5\n", ""))

      test("sizeof(typedef int)",
      "{typedef A = int  print_l(sizeof(A))}",
      null,
      (0, "4\n", ""))
      
      test("sizeof(typedef int)",
      "{typedef A = int[5] typedef B = A  print_l(sizeof(B))}",
      null,
      (0, "20\n", ""))
  }
 

}