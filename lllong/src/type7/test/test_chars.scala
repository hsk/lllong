package type7.test
import type7._

object test_chars extends TestCase {
  import test._

  def apply() {
    test("byte 10を表示",
      "{\nprint_b(10L)\n}",
      null,
      (0, "10\n", ""))
    test("文字列出力''",
      """{println("")}""",
      null,
      (0, "\n", ""))
    test("文字列出力'a'",
      """{println("a")}""",
      null,
      (0, "a\n", ""))

    test("文字列出力1",
      """{println("a\"")}""",
      null,
      (0, "a\"\n", ""))

    test("文字列出力2",
      """{println("a\b")}""",
      null,
      (0, "a\b\n", ""))
    test("文字列出力3",
      """{println("a\f")}""",
      null,
      (0, "a\f\n", ""))
    test("文字列出力4",
      """{println("a\n")}""",
      null,
      (0, "a\n\n", ""))
    test("文字列出力5",
      """{println("a\r")}""",
      null,
      (0, "a\n", ""))
    test("文字列出力6",
      """{println("a\t")}""",
      null,
      (0, "a\t\n", ""))
    test("文字列出力7",
      """{println("a\\")}""",
      null,
      (0, "a\\\n", ""))
    test("文字列出力8",
      """{println("a\a")}""",
      null,
      (0, "a\\a\n", ""))
    test("文字列出力9",
      """{println("\u03bb1")}""",
      null,
      (0, "λ1\n", ""))
    test("文字列出力10",
      """{println("あいうえa")}""",
      null,
      (0, "あいうえa\n", ""))
 }
}