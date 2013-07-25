package type7.test
  import type7._

object test_alpha  extends TestCase {
  import type7.test.test_globals._

  def apply() {
    test("alpha1",
      "def main() { var i = 1 var i = i+1 print_l(i) }",
      null,
      (0, "2\n", ""))

    test("alpha1",
      """def main() {
        for(var i:int = 0; i < 10;i++) {
        }
        for(var i:int = 0; i < 10;i++) {
        }
        print_i(i)
        }""",
      null,
      (0, "10\n", ""))
      
      
  }

}