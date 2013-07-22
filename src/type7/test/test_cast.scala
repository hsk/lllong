package type7.test
import type7._

object test_cast extends TestCase {

  import test._

  def apply() {

    test("long を double にする",
      "{ var a:double var b:long a = 10.0 b = 2 a = a + b; print_d(a)}",
      null,
      (0, "12.000000\n", ""))

    test("long を double にする",
      "{ var a:double var b:long a = 10.0 b = 2 a = b + a; print_d(a)}",
      null,
      (0, "12.000000\n", ""))
      
    test("double を long にする",
      "{ var a:double var b:long a = 10.0 b = 2 b = cast(long)a + b; print_l(b)}",
      null,
      (0, "12\n", ""))

    test("double を long にする",
      "{ var a:double var b:long a = 10.0 b = 2 b = b + cast(long)a; print_l(b)}",
      null,
      (0, "12\n", ""))

    test("byte を long にする",
      "{ var a:byte var b:long a = 10 b = 2 b = a + b; print_l(b)}",
      null,
      (0, "12\n", ""))
    test("byte を long にする",
      "{ var a:byte var b:long a = 10 b = 2 b = b + a; print_l(b)}",
      null,
      (0, "12\n", ""))

    test("long を byte にする",
      "{ var a:byte var b:long a = 255 b = 2 a = cast(byte)b + a; print_b(a)}",
      null,
      (0, "1\n", ""))
/*
    test("float を double にする",
      "{ var a:double; var b:float; a = 255.0 b = 2.0 a = cast(double)b + a; print_d(a)}",
      null,
      (0, "257.000000\n", ""))
  */    
  }

}