package type7.test
import type7._

object test_global_var extends TestCase {

  import type7.test.test_globals._
  
  def apply() {

    test("fun void",
        """
        typedef Game = struct {
          score:int
        }
        def main() {
          Game_new(&game)
          print_i(game.score)
        }
        var game:Game
  def Game_new(game:*Game) {
    game->score = 110
  }
""",
      null,
      (0, "110\n", ""))


    test("fun void",
        """
        def init(a:Ptr[int]) {}
        def main(argc:int, argv:Ptr[Ptr[char]]) {
          init(&argc)
        }
""",
      null,
      (0, "", ""))
      
    test("fun void",
        """
  typedef Game = struct {
    move:(Ptr[Game])=>void
  }
  var game:Game
          def Game_title(game:*Game) {
        print_i(10);
  } 
        def main() {
          game.move = Game_title
          game.move(&game)
        }
""",
      null,
      (0, "10\n", ""))
      
    test("fun void",
        """
        def f(a:float,b:float) {
          var c = Array(a,b)
        }
        def main() {
          f(1.1,2.2)
        }
""",
      null,
      (0, "", ""))

  
  }

}