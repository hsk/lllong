package type7.test

import type7._

object test_mul {
  import test._

  def apply() {
    test("byte かけ算結果表示",
      "{var a:byte; var b:byte; var c:byte; a=2; b = 3; c = a * b; print_b(c)}",
      EPrint(Ti(8), EMul(Ti(8), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "6\n", ""))
    test("short かけ算結果表示",
      "{var a:short; var b:short; var c:short; a=2; b = 3; c = a * b; print_s(c)}",
      EPrint(Ti(16), EMul(Ti(16), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "6\n", ""))
    test("int かけ算結果表示",
      "{var a:int; var b:int; var c:int; a=2; b = 3; c = a * b; print_i(c)}",
      EPrint(Ti(32), EMul(Ti(32), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "6\n", ""))
    test("long かけ算結果表示",
      "{var a:long; var b:long; var c:long; a=2; b = 3; c = a * b; print_l(c)}",
      EPrint(Ti(64), EMul(Ti(64), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "6\n", ""))
    test("double かけ算結果表示",
      "{var a:double; var b:double; var c:double; a=2.0; b = 3.0; c = a * b; print_d(c)}",
      EPrint(Td, EMul(Td, ELdd(Td, 2.0), ELdd(Td, 3.0))),
      (0, "6.000000\n", ""))
    test("float かけ算結果表示",
      "{var a:float; var b:float; var c:float; a=2.0; b = 3.0; c = a * b; print_f(c)}",
      EPrint(Tf, EMul(Tf, ELdd(Td, 2.0), ELdd(Td, 3.0))),
      (0, "6.000000\n", ""))
  }
}

object test_div {
  import test._

  def apply() {
    test("byte 割り算結果表示",
      "{var a:byte; var b:byte; var c:byte; a=8; b = 3; c = a / b; print_b(c)}",
      EPrint(Ti(8), EDiv(Ti(8), ELd(Ti(64), 8), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("short 割り算結果表示",
      "{var a:short; var b:short; var c:short; a=8; b = 3; c = a / b; print_s(c)}",
      EPrint(Ti(16), EDiv(Ti(16), ELd(Ti(64), 8), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("int 割り算結果表示",
      "{var a:int; var b:int; var c:int; a=8; b = 3; c = a / b; print_i(c)}",
      EPrint(Ti(32), EDiv(Ti(32), ELd(Ti(64), 8), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("long 割り算結果表示",
      "{var a:long; var b:long; var c:long; a=8; b = 3; c = a / b; print_l(c)}",
      EPrint(Ti(64), EDiv(Ti(64), ELd(Ti(64), 8), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("float 割り算結果表示",
      "{var a:float; var b:float; var c:float; a=9.0; b = 3.0; c = a / b; print_f(c)}",
      EPrint(Tf, EDiv(Tf, ELdd(Td, 9.0), ELdd(Td, 3.0))),
      (0, "3.000000\n", ""))
    test("double 割り算結果表示",
      "{var a:double; var b:double; var c:double; a=9.0; b = 3.0; c = a / b; print_d(c)}",
      EPrint(Td, EDiv(Td, ELdd(Td, 9.0), ELdd(Td, 3.0))),
      (0, "3.000000\n", ""))
  }
}

object test_mod {
  import test._

  def apply() {
    test("byte 剰余結果表示",
      "{var a:byte; var b:byte; var c:byte; a=7; b = 3; c = a % b; print_b(c)}",
      EPrint(Ti(8), EMod(Ti(8), ELd(Ti(64), 7), ELd(Ti(64), 3))),
      (0, "1\n", ""))
    test("short 剰余結果表示",
      "{var a:short; var b:short; var c:short; a=7; b = 3; c = a % b; print_s(c)}",
      EPrint(Ti(16), EMod(Ti(16), ELd(Ti(64), 7), ELd(Ti(64), 3))),
      (0, "1\n", ""))
    test("int 剰余結果表示",
      "{var a:int; var b:int; var c:int; a=7; b = 3; c = a % b; print_i(c)}",
      EPrint(Ti(32), EMod(Ti(32), ELd(Ti(64), 7), ELd(Ti(64), 3))),
      (0, "1\n", ""))
    test("long 剰余結果表示",
      "{var a:long; var b:long; var c:long; a=7; b = 3; c = a % b; print_l(c)}",
      EPrint(Ti(64), EMod(Ti(64), ELd(Ti(64), 7), ELd(Ti(64), 3))),
      (0, "1\n", ""))
  }
}

object test_neg {
  import test._

  def apply() {
    test("byte マイナス結果表示",
      "{var a:byte; var c:byte; a=2; c = -a; print_b(c)}",
      EPrint(Ti(8), ENeg(Ti(8), ELd(Ti(64), 2))),
      (0, "-2\n", ""))
    test("short マイナス結果表示",
      "{var a:short; var c:short; a=2; c = -a; print_s(c)}",
      EPrint(Ti(16), ENeg(Ti(16), ELd(Ti(64), 2))),
      (0, "-2\n", ""))
    test("int マイナス結果表示",
      "{var a:int; var c:int; a=2; c = -a; print_i(c)}",
      EPrint(Ti(32), ENeg(Ti(32), ELd(Ti(64), 2))),
      (0, "-2\n", ""))
    test("long マイナス結果表示",
      "{var a:long; var c:long; a=2; c = -a; print_l(c)}",
      EPrint(Ti(64), ENeg(Ti(64), ELd(Ti(64), 2))),
      (0, "-2\n", ""))
    test("float マイナス結果表示",
      "{var a:float; var c:float; a=2.0; c = -a; print_f(c)}",
      EPrint(Tf, ENeg(Tf, ELdd(Td, 2.0))),
      (0, "-2.000000\n", ""))
    test("double マイナス結果表示",
      "{var a:double; var c:double; a=2.0; c = -a; print_d(c)}",
      EPrint(Td, ENeg(Td, ELdd(Td, 2.0))),
      (0, "-2.000000\n", ""))
  }
}

object test_shl {
  import test._

  def apply() {
    test("byte 左シフト結果表示",
      "{var a:byte; var b:byte; var c:byte; a=2; b = 3; c = a << b; print_b(c)}",
      EPrint(Ti(8), EShl(Ti(8), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "16\n", ""))
    test("short 左シフト結果表示",
      "{var a:short; var b:short; var c:short; a=2; b = 3; c = a << b; print_s(c)}",
      EPrint(Ti(16), EShl(Ti(16), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "16\n", ""))
    test("int 左シフト結果表示",
      "{var a:int; var b:int; var c:int; a=2; b = 3; c = a << b; print_i(c)}",
      EPrint(Ti(32), EShl(Ti(32), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "16\n", ""))
    test("long 左シフト結果表示",
      "{var a:long; var b:long; var c:long; a=2; b = 3; c = a << b; print_l(c)}",
      EPrint(Ti(64), EShl(Ti(64), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "16\n", ""))
  }
}

object test_shr {
  import test._

  def apply() {
    test("byte 算術右シフト結果表示",
      "{var a:byte; var b:byte; var c:byte; a=64; b = 1; c = a >>> b; print_b(c)}",
      EPrint(Ti(8), EShr(Ti(8), ELd(Ti(64), 65), ELd(Ti(64), 1))),
      (0, "32\n", ""))
    test("byte 算術右シフト結果表示",
      "{var a:byte; var b:byte; var c:byte; a= -1; b = 1; c = a >>> b; print_b(c)}",
      EPrint(Ti(8), EShr(Ti(8), ELd(Ti(8), -1), ELd(Ti(8), 1))),
      (0, "-1\n", ""))
    test("short 算術右シフト結果表示",
      "{var a:short; var b:short; var c:short; a=64; b = 1; c = a >>> b; print_s(c)}",
      EPrint(Ti(16), EShr(Ti(16), ELd(Ti(64), 64), ELd(Ti(64), 1))),
      (0, "32\n", ""))
    test("int 算術右シフト結果表示",
      "{var a:int; var b:int; var c:int; a=64; b = 1; c = a >>> b; print_i(c)}",
      EPrint(Ti(32), EShr(Ti(32), ELd(Ti(64), 64), ELd(Ti(64), 1))),
      (0, "32\n", ""))
    test("long 算術右シフト結果表示",
      "{var a:long; var b:long; var c:long; a=64; b = 1; c = a >>> b; print_l(c)}",
      EPrint(Ti(64), EShr(Ti(64), ELd(Ti(64), 64), ELd(Ti(64), 1))),
      (0, "32\n", ""))
  }
}

object test_ushr {
  import test._

  def apply() {
    test("byte 右シフト結果表示",
      "{var a:byte; var b:byte; var c:byte; a=67; b = 2; c = a >> b; print_b(c)}",
      EPrint(Ti(8), EUshr(Ti(8), ELd(Ti(64), 67), ELd(Ti(64), 2))),
      (0, "16\n", ""))
    test("short 右シフト結果表示",
      "{var a:short; var b:short; var c:short; a=67; b = 2; c = a >> b; print_s(c)}",
      EPrint(Ti(16), EUshr(Ti(16), ELd(Ti(64), 67), ELd(Ti(64), 2))),
      (0, "16\n", ""))
    test("int 右シフト結果表示",
      "{var a:int; var b:int; var c:int; a=67; b = 2; c = a >> b; print_i(c)}",
      EPrint(Ti(32), EUshr(Ti(32), ELd(Ti(64), 67), ELd(Ti(64), 2))),
      (0, "16\n", ""))
    test("long 右シフト結果表示",
      "{var a:long; var b:long; var c:long; a=67; b = 2; c = a >> b; print_l(c)}",
      EPrint(Ti(64), EUshr(Ti(64), ELd(Ti(64), 67), ELd(Ti(64), 2))),
      (0, "16\n", ""))
  }
}

object test_and {
  import test._

  def apply() {
    test("byte and結果表示",
      "{var a:byte; var b:byte; var c:byte; a=2; b = 3; c = a & b; print_b(c)}",
      EPrint(Ti(8), EAnd(Ti(8), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("short and結果表示",
      "{var a:short; var b:short; var c:short; a=2; b = 3; c = a & b; print_s(c)}",
      EPrint(Ti(16), EAnd(Ti(16), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("int and結果表示",
      "{var a:int; var b:int; var c:int; a=2; b = 3; c = a & b; print_i(c)}",
      EPrint(Ti(32), EAnd(Ti(32), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "2\n", ""))
    test("long and結果表示",
      "{var a:long; var b:long; var c:long; a=2; b = 3; c = a & b; print_l(c)}",
      EPrint(Ti(64), EAnd(Ti(64), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "2\n", ""))
  }
}

object test_or {
  import test._

  def apply() {
    test("byte or結果表示",
      "{var a:byte; var b:byte; var c:byte; a=6; b = 3; c = a | b; print_b(c)}",
      EPrint(Ti(8), EOr(Ti(8), ELd(Ti(64), 4), ELd(Ti(64), 3))),
      (0, "7\n", ""))
    test("short or結果表示",
      "{var a:short; var b:short; var c:short; a=4; b = 3; c = a | b; print_s(c)}",
      EPrint(Ti(16), EOr(Ti(16), ELd(Ti(64), 5), ELd(Ti(64), 3))),
      (0, "7\n", ""))
    test("int or結果表示",
      "{var a:int; var b:int; var c:int; a=5; b = 3; c = a | b; print_i(c)}",
      EPrint(Ti(32), EOr(Ti(32), ELd(Ti(64), 6), ELd(Ti(64), 3))),
      (0, "7\n", ""))
    test("long or結果表示",
      "{var a:long; var b:long; var c:long; a=7; b = 3; c = a | b; print_l(c)}",
      EPrint(Ti(64), EOr(Ti(64), ELd(Ti(64), 7), ELd(Ti(64), 3))),
      (0, "7\n", ""))
  }
}

object test_xor {
  import test._

  def apply() {
    test("byte xor結果表示",
      "{var a:byte; var b:byte; var c:byte; a=2; b = 3; c = a ^ b; print_b(c)}",
      EPrint(Ti(8), EXor(Ti(8), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "1\n", ""))
    test("short xor結果表示",
      "{var a:short; var b:short; var c:short; a=2; b = 3; c = a ^ b; print_s(c)}",
      EPrint(Ti(16), EXor(Ti(16), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "1\n", ""))
    test("int xor結果表示",
      "{var a:int; var b:int; var c:int; a=2; b = 3; c = a ^ b; print_i(c)}",
      EPrint(Ti(32), EXor(Ti(32), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "1\n", ""))
    test("long xor結果表示",
      "{var a:long; var b:long; var c:long; a=2; b = 3; c = a ^ b; print_l(c)}",
      EPrint(Ti(64), EXor(Ti(64), ELd(Ti(64), 2), ELd(Ti(64), 3))),
      (0, "1\n", ""))
  }
}