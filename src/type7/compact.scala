/*
 * Copyright (c) 2010 h_sakurai, freecluster.net. All rights reserved.
 *
 * compact.scala
 * Functional Top Down Operator Precedence Compact eXPression parser
 */
package type7

import scala.util.matching.Regex
import util.parsing.input.Positional
import util.parsing.input.Position
import util.parsing.input.OffsetPosition

/** トークン */
trait Token extends Positional
/** 識別子 */
case class Id(a: String) extends Token
/** シンボル */
case class Sym(a: String) extends Token
/** 倍精度浮動小数点数 */
case class Dbl(a: Double) extends Token
/** 64bit符号付き整数 */
case class Lng(a: Long) extends Token
/** 文字列 */
case class Str(a: String) extends Token

/**
 * Compactパーサ
 * 
 * Compactは意味を持たないC言語のような式言語です。
 * compactオブジェクトを使う事でCompactをパースできます。
 * 
 * 下降型の演算子順位法を用いて構文解析します。
 *
 * usage:
 * {{{
 * val exp = compact("1+2*3")
 * println(exp)
 * }}}
 */
object compact {

  /**
   * テスト用のメイン関数
   */
  def main(argv: Array[String]) {
    println(parse("a[1]\nlightpos[0] b; p(1)"))
  }

  private val com1 = """(?s)^(//[^\r\n]*)(\r\n|\r|\n)(.*$)""".r
  private val com = """(?s)^(/\*.*?\*/)(.*$)""".r
  private val xnum = """(?s)^(0x)([0-9A-Fa-f]+)(L?)(.*$)""".r
  private val num = """(?s)^([0-9]+)(L?)(.*$)""".r
  private val dnum = """(?s)^([0-9]+\.[0-9]*)(.*$)""".r
  private val sym = """(?s)^(')([^-\+*\/\(\)\[\]\{\}\s\=\;\:<>,\&\.%!]+)(.*$)""".r
  private val ptn = """(?s)^([-\+*\/\=<>&!]+|[\(\)\[\]\{\},\.%?]|[^-\+*\/\(\)\[\]\{\}\s\=\;\:<>,\&\.%!?]+|$)(.*$)""".r
  private val eol = """(?s)^([;:])(.*$)""".r
  private val spc1 = """(?s)^(\r\n|\r|\n)(.*$)""".r
  private val spc = """(?s)^([\s]+)(.*$)""".r
  private val str1 = """(?s)^("(\\.|[^"\\]*)*")(.*$)""".r
  private val eof = """(?s)^[\s]*($)""".r

  
  /** 前置演算子の種類を表します。OpはOperator Prefixの略です。 */
  trait Op
  /** 左結合前置演算子 例) -1*/
  case class Opl(a: Int) extends Op
  /** かっこ演算子 例) ( 1 ) */
  case class OpP(a: Int, e: Id) extends Op
  /** 文演算子 例) if ( true ) 3 */
  case class OpS(a: Int, st: Id, ep: Id) extends Op
  var prs = Map[String, Op](
    "import" -> Opl(10),
    "new" -> Opl(10),
    "gcnew" -> Opl(10),
    "sizeof" -> Opl(10),
    "typedef" -> Opl(4),
    "-" -> Opl(100),
    "*" -> Opl(99),
    "&" -> Opl(100),
    "!" -> Opl(90),
    "var" -> Opl(10),
    "def" -> Opl(10),
    "return" -> Opl(10),
    "goto" -> Opl(10),
    "case" -> OpP(31, Id(":")),
    "(" -> OpP(0, Id(")")),
    "{" -> OpP(0, Id("}")),
    "[" -> OpP(0, Id("]")),

    "cast" -> OpS(2, Id("("), Id(")")),

    "if" -> OpS(2, Id("("), Id(")")),
    "fun" -> OpS(2, Id("("), Id(")")),
    "mac" -> OpS(2, Id("("), Id(")")),
    "while" -> OpS(2, Id("("), Id(")")),
    "do" -> OpS(2, Id("{"), Id("}")),
    "for" -> OpS(2, Id("("), Id(")")))

  /** 演算子の種類を表します。OInはOperator Infixの略です。 */
  sealed trait OIn
  /** 左結合２項演算子 */
  case class OIl(np: Int) extends OIn
  /** 右結合２項演算子 */
  case class OIr(np: Int) extends OIn
  /** メッセージ演算子 */
  case class OIp(np: Int, ep: Token) extends OIn
  /** 後置単項演算子 */
  case class OIe(np: Int) extends OIn

  /** 中置、後置、メッセージ演算子 */
  var ins = Map[String, OIn](
    "." -> OIl(100),
    "->" -> OIl(100),
    "=>" -> OIl(90),
    ":" -> OIl(30),
    "*" -> OIl(50),
    "&" -> OIl(50),
    "|" -> OIl(50),
    "^" -> OIl(50),
    "%" -> OIl(50),
    "<<" -> OIl(50),
    ">>" -> OIl(50),
    ">>>" -> OIl(50),
    "/" -> OIl(20),
    "-" -> OIl(10),
    "+" -> OIl(10),
    "<" -> OIl(6),
    "<=" -> OIl(6),
    ">=" -> OIl(6),
    ">" -> OIl(6),
    "!=" -> OIl(5),
    "==" -> OIl(5),
    "&&" -> OIl(4),
    "||" -> OIl(4),
    "," -> OIr(1),
    "else" -> OIl(3),
    "+=" -> OIr(5),
    "-=" -> OIr(5),
    "=" -> OIr(5),
    "(" -> OIp(100, Id(")")),
    "{" -> OIp(100, Id("}")),
    "[" -> OIp(100, Id("]")),

    "++" -> OIe(5),
    "--" -> OIe(5),
    "?" -> OIe(4),
    "is" -> OIl(3),
    ";" -> OIe(3))

  /**
   * パーサ
   * 
   * @param src: String パースしたい文字列
   */
  def parse(src: String): Any = {
    var connectf = true

    var str = src
    var token: Token = null
    var ptoken: Token = null
    var offset = 0
    def lex(): Token = {
      ptoken = token
      connectf = true
      def t() {
        def setToken(s:String,t: Token, e:String) {
          t.pos = new OffsetPosition(src, offset)
          offset += s.length
          token = t
          str = e
        }
        str match {
          case com(a, e) => str = e; offset+=a.length; t()
          case com1(a, b, e) => str = e; offset+=a.length+b.length; t()
          case eol(a, e) => connectf = false; setToken(a,Id(a),e)
          case eof(e) => setToken(e,Id(null), "")
          case sym(a, b, e) => setToken(a+b,Sym(b), e)
          case dnum(a, e) => setToken(a,Dbl(a.toDouble), e)
          case xnum(a, b, c, e) => setToken(a+b+c,Lng(java.lang.Long.parseLong(b,16)), e)
          case num(a, b, e) => setToken(a+b,Lng(a.toLong), e)
          case str1(a, b, e) => str = e; println(str); setToken(a, Str(replaceStr(a)), e)
          case ptn(a, e) => setToken(a,Id(a), e)
          case spc1(a, e) => str = e; connectf = false; offset+=a.length; t()
          case spc(a,e) => str = e; offset+=a.length; t()
        }
      }
      t()
      ptoken
    }
    def replaceStr(e:String):String = {
      //println("e='"+e+"'")
      val e2 = e.substring(1, e.length - 1).
        replaceAll("""\\"""","\"").
        replaceAll("""\\b""","\b").
        replaceAll("""\\f""","\f").
        replaceAll("""\\n""","\n").
        replaceAll("""\\r""","\r").
        replaceAll("""\\t""","\t").
        replaceAll("""\\\\""","\\\\")
      //  """\\u([0-9a-fA-F]{4})""".r.replaceAllIn(e2, m => String.valueOf(Integer.parseInt(m.group(1), 16)) )
      //println("e2='"+e2+"'")
      e2
    }
    lex()

    def eat(e: Any, er:Token, s:String): Any = {
      if (lex() != e) {
        throw new TypeError(ptoken.pos, "syntax error. expected is '" + e + "' but found unexpected token " + ptoken+"\n"+er.pos+" "+s)
      }
      ptoken
    }

    def exp(p: Int): Any = {
      if (token == Id(")") || token == Id("}") || token == Id("]") || token == Id(":") ) return Id("void")
      def pr(t: Token): Any = {
        t match {
          case Id(op) =>
            //println("pr "+op)
            prs.getOrElse(op, null) match {
              case OpP(np, ep) =>
                val e = loop(exp(np),np); val e2 = (t, e, eat(ep,t,"括弧の閉じタグが見つからなかった"))
                //println("e2="+e2)
                e2
              case Opl(np) => (t, exp(np))
              case OpS(np, sp, ep) =>
                eat(sp, t, op+"に対応する開始の括弧が見つからなかった")
                val e = loop(exp(0))
                eat(ep, t, op+"に対応する終了の括弧が見つからなかった")
                (t, sp, e, ep, exp(np))
              case _ => t
            }
          case _ => t
        }
      }
      
      var t = pr(lex())
      def in(t: Any): Any = {
        token match {
          case Id(op) =>
            ins.getOrElse(op, null) match {
              case OIl(np) if (np > p) => in(t, lex(), exp(np))
              case OIr(np) if (np >= p) => in(t, lex(), exp(np))
              case OIe(np) if (np >= p) => in(t, lex())
              case OIp(np, ep) if (np > p && connectf) =>
                val sp = lex(); val e = loop(exp(0)); in(t, sp, e, eat(ep,sp, op+"の閉じ括弧が見つからなかった"))
              case _ => t
            }
          case _ => t
        }
      }
      in(t)
    }
    def loop(t: Any, p:Int = 0): Any = token match {
      case Id(")") | Id("}") | Id("]") | Id(":") => t
      case Id(null) => t
      case Id("void") => t
      case _ => (t, Id("@"), loop(exp(p)))
    }
    val rc = loop(exp(0))
    rc
  }
}