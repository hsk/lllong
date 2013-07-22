package type7.test
import type7._

object test_return extends TestCase {

  import type7.test.test_globals._
  
  def apply() {

    test("fun void",
      "def main():void = {" +
      "myprint(3);" +
      "}" +
      "def myprint(a:long):void = {" +
      "  print_l(a); return" +
      "}",
      null,
      (0, "3\n", ""))

    test("fun void",
      "def main():void = {" +
      "print_l(a());" +
      "}" +
      "def a():long = 1",
      null,
      (0, "1\n", ""))

//    type7.test.test.registerMachine = false
    test("fun void",
      "def main():void = { print_l({print_l(1);33});}",
      null,
      (0, "1\n33\n", ""))
    test("fun return 1",
      "def a():long = {return 1;1+2;} def main():void = { print_l(a())}",
      null,
      (0, "1\n", ""))
    test("tail void",
      "def main():void = { print_l({print_l(1);33}); 1}",
      null,
      (0, "1\n33\n", ""))
    test("tail if 1",
      "def main():void = { print_l({print_l(1);33});if(1)2 else 2;}",
      null,
      (0, "1\n33\n", ""))
    test("tail if 2",
      "def main():void = { print_l({print_l(1);33});if(1)print_l(1) else print_l(2);}",
      null,
      (0, "1\n33\n1\n", ""))
    test("tail if 3",
      "def main():void = { print_l({print_l(1);33});if(0)print_l(1) else print_l(2);}",
      null,
      (0, "1\n33\n2\n", ""))
      
    test("tail if 4",
      "def main():void = { print_l({print_l(1);33});if(1)print_l(1) else 1;}",
      null,
      (0, "1\n33\n1\n", ""))

    test("tail if 5",
      "def main():void = { print_l({print_l(1);33});if(1)return 1; else 1;}",
      null,
      null)
    test("tail if 6",
      "def main():void = { print_l({print_l(1);33});if(0)print_l(1) else 1;}",
      null,
      (0, "1\n33\n", ""))
    test("tail if 7",
      "def main():void = { print_l({print_l(1);33});if(1)print_l(1) else 1;}",
      null,
      (0, "1\n33\n1\n", ""))
      
    test("tail if 8",
      "def main():void = { print_l({print_l(1);33});if(1)return; else 1;}",
      null,
      (0, "1\n33\n", ""))
    test("tail if a 1",
      "def main():void = { print_l(a()); } def a():long = {if(1)return 1; else 2;}",
      null,
      (0, "1\n", ""))
    test("tail if a 2",
      "def main():void = { print_l(a()); } def a():long = {if(0)return 1; else 2;}",
      null,
      (0, "2\n", ""))
    test("tail if a 3",
      "def main():void = { print_l(a()); } def a():long = {if(1)return 1; if(0)return 2 else 3;}",
      null,
      (0, "1\n", ""))
    test("tail if a 4",
      "def main():void = { print_l(a()); } def a():long = {if(0)return 1; if(1)return 2 else 3;}",
      null,
      (0, "2\n", ""))
    test("tail if a 5",
      "def main():void = { print_l(a()); } def a():long = {if(0)return 1; if(0)return 2 else 3;}",
      null,
      (0, "3\n", ""))
  }

}