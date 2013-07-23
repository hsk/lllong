package type7.test

import type7._
object test {
  val llvm = true
  var registerMachine = true
  var mode: Mode = Parse
  //  var parserMode = "combinator"
  var parserMode = "compact"

  def test(name: String, s: String, ast: E, output: Any) {
    val ast2 = if(ast==null) null else Prog(List(EFun(Tv, "main", Map("argn" -> Ti(64), "argv" -> Ti(64)), ast)))
    val s2 = "def main(){"+s+"}";
    t(name, s2, ast2, output)
  }

  def t(name: String, s: String, ast: Prog, output: Any) {
    try {
      mode match {
        case Parse =>
          println(s)
          val tast = parserMode match {
            case "compact" =>
              val st = compact.parse(s)
              //val st2 = transClass(st)
              val ast = transduce(st)
              println("ast=" + ast)
              typing(ast)
            case "combinator" =>
              throw new Exception("not support")
              //val r = parser.parse(s)
              //        println(r)
              //typing(r.get)
          }
          println("tast=" + tast)
          mode = Compile_Emit
          t(name, s, tast, output)
          mode = Parse
        case Compile_Emit =>
          env.init()
          global_env.init()
          if (ast == null) return
          typing.checkGlobalType(ast)
          if (llvm) {
            registerMachine match {
              case true =>
                val codes = kNormal(ast)
                val codes2 = constFold(codes)
                println("codes="+codes2)
                llemit("e.ll", codes2)
              case false =>
                val codes = type7.stackMachine.compile(ast)
                type7.stackMachine.ll_emit("e.ll", codes)
            }
            exec("llc -mcpu=x86-64 e.ll -o e.s") match {
              case (0, "", "") =>
              case e => throw new Exception("error compile e.ll " + e)
            }
            exec("gcc e.s lib/stdio.c") match {
              case (0, "", "") =>
              case e => throw new Exception("error compile e.s " + e)
            }
          } else {
            //emit("e.s", codes)
            //exec("gcc e.s lib/stdio.c") match {
            //  case (0, "", "") =>
            //  case e => throw new Exception("error compile e.s " + e)
            //}
          }
          val result = exec("./a.out")
          if (result != output) {
            throw new Exception("test " + name + " error.\nexpected is " + 
                (""+output).replaceAll("\\n","\\\\n").replaceAll("\\r","\\\\r") + 
                " but result is " + (""+result).replaceAll("\\n","\\\\n").replaceAll("\\r","\\\\r"))
          } else {
            println("test " + name + " ok.")
          }
      }
    } catch {
      case e if (output == null) => println("test " + name + " ok. " + e)
      case e:Throwable => throw e

    }
  }
  
  trait Mode
  case object Parse extends Mode
  case object Compile_Emit extends Mode

  def main(argv: Array[String]) {
    val start = System.currentTimeMillis()

    List[Mode](Parse).foreach {
      m => mode = m; test_exprs(); println("---- " + m + " test end")
    }

    List[Mode](Parse).foreach {
      m => mode = m; test_globals(); println("---- " + m + " test globals end")
    }

    val end = System.currentTimeMillis()
    println((end - start) / 1000.0 + "sec")
  }

  def test_exprs() {
    test_long()
    test_struct()
    test_typedef()
    test_byte()
    test_int()
    test_short()
    test_double()
    test_float()

    test_sizeof()
    test_mul()
    test_div()
    test_mod()
    test_neg()
    test_shl()
    test_shr()
    test_ushr()
    test_and()
    test_or()
    test_xor()
    test_cast()
    test_syntax_sugar()
    test_if()
    test_chars()
  }

  def test_globals() {
    test_fun()
    test_return()
    test_global_var()
  }
}

object test_globals {
  import type7.test.test._
  def test(name: String, s: String, ast: Prog, output: Any) {
    t(name, s, ast, output)
  }
}

trait TestCase {
  import test._
  def main(argv: Array[String]) {
    val start = System.currentTimeMillis()
    List[Mode](Parse).foreach {
      m => mode = m; apply(); println("---- " + m + " test end")
    }
    val end = System.currentTimeMillis()
    println((end - start) / 1000.0 + "sec")
  }
  def apply();
}

