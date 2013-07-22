package type7.test
import type7._

object test_syntax_sugar extends TestCase {

  import test._

  def apply() {
    test("long を byte にする",
      "{ var a:byte var b:long a = 255 b = 2 a = cast(byte)b + a; print_b(a)}",
      null,
      (0, "1\n", ""))

    test("long を double にする",
      "{ var a:double = 10.0 var b:long = 2 a = a + b; print_d(a)}",
      null,
      (0, "12.000000\n", ""))

    test("簡単な型推論",
      "{ var a = 10.0 var b = 2 a = a + b; print_d(a)}",
      null,
      (0, "12.000000\n", ""))
    test("文字列リテラル",
      "println(\"aaaa\")",  
      null,
      (0, "aaaa\n", ""))
  }

}