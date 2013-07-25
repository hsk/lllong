package type7
import scala.util.parsing.input.Positional
import scala.collection.immutable.ListMap

/**
 * 型
 */
sealed trait T extends Positional

/** 符号付き整数型 */
case class Ti(i: Int) extends T
/** 符号無し整数型 */
case class Tu(i: Int) extends T
/** 単精度浮動小数点数 */
case object Tf extends T
/** 倍精度浮動小数点数 */
case object Td extends T
/** 型未定義 */
case object Tn extends T
/** void型 */
case object Tv extends T
/** リターン値型 */
case class Tr(t: T) extends T
/** ポインタ型 */
case class Tp(t: T) extends T
/** 配列型 */
case class TArr(t: T, size: Long) extends T
/** 構造体型 */
case class TStr(members: ListMap[String, T]) extends T
/** 型定義 */
case class TDef(id: String) extends T
/** 関数型 */
case class TFun(rc: T, prms: List[T]) extends T

/**
 * ソースコード上の表現で型を文字列化します
 */
object ttos {
  def apply(t: T): String = {
    t match {
      case Ti(8) => "byte"
      case Ti(16) => "short"
      case Ti(32) => "int"
      case Ti(64) => "long"
      case Tu(8) => "ubyte"
      case Tu(16) => "ushort"
      case Tu(32) => "uint"
      case Tu(64) => "ulong"
      case Tf => "float"
      case Td => "double"
      case Tn => "void"
      case Tv => "void"
      case Tr(t: T) => "Ref[" + ttos(t) + "]"
      case Tp(t: T) => "Ptr[" + ttos(t) + "]"
      case TArr(t: T, size: Long) => "Array[" + ttos(t) + "," + size + "]"
      case TStr(members: Map[String, T]) => "struct{" + members + "}"
      case TDef(id: String) => id
      case TFun(rc: T, prms: List[T]) =>
        "(" + prms.foldLeft("") { case ("", a) => ttos(a) case (e, a) => e + ", " + a } + ")->" + ttos(rc)
      case _ => throw new Exception("error type " + t)
    }
  }
}

/**
 * 1文字表現で型を文字列化します
 */
object tName {
  def apply(t: T): String = {
    t match {
      case Ti(8) => "b"
      case Ti(16) => "s"
      case Ti(32) => "i"
      case Ti(64) => "l"
      case Tu(8) => "c"
      case Tu(16) => "w"
      case Tu(32) => "u"
      case Tu(64) => "q"
      case Tf => "f"
      case Td => "d"
      case TDef(id) => tName(env.find(id))
      case _: TArr => "p"
      case _: TStr => "p"
      case _: TFun => "p"
      case _: Tp => "a"
      case _: Tr => "a"
      case _ => throw new Exception("a " + t)
    }
  }
}

/**
 * 抽象構文木
 */
sealed trait E extends Positional {
  def t: T
  override def toString():String = pp(this)
}

/** 変数定義 */
case class EVar(t1: T, id: String, i: E = null) extends E { val t = Tv }
/** 不変変数定義 */
case class EVal(t1: T, id: String, i: E) extends E { val t = Tv }
/** ブロック構文 */
case class EBlock(t: T, b: List[E]) extends E
/** 整数定数ロード */
case class ELd(t: T, i: Long) extends E
/** 浮動小数点数定数ロード */
case class ELdd(t: T, i: Double) extends E
/** 文字列定数ロード */
case class ELds(t: T, i: String) extends E
/** 変数の参照 */
case class EId(t: T, id: String) extends E {
  override def toString(): String = "EId(" + t + "," + id + ")" + this.pos + "\n"
}
/** 配列 */
case class EArray(t: T, id: E, idx: E) extends E
/** 二項演算子 */
case class EBin(t: T, it: T, i: String, a: E, b: E) extends E
/** -単項演算子 */
case class ENeg(t: T, a: E) extends E
/** !演算子 */
case class ENot(t: T, a: E) extends E
/** 代入 */
case class EAssign(t: T, a: E, b: E) extends E
/** 配列割り当て */
case class ENewArray(t: T, a: E) extends E
/** ヒープから割り当て */
case class ENew(t: T) extends E
/** GC付きの変数の割り当て */
case class EGCNew(t: T) extends E
/** ポインタ値取得 */
case class ERef(t: T, a: E) extends E
/** ポインタ値参照 */
case class EPtr(t: T, a: E) extends E
/** 構造体のフィールド参照 */
case class EField(t: T, t2: T, a: E, id: String) extends E
/** アロー演算子 */
case class EArrow(t: T, t2: T, a: E, id: String) extends E
/** 型定義 */
case class ETypeDef(t1: T, id: String) extends E { val t = Tv }
/** コメント */
case class ENop(t: T, s: String) extends E
/** 関数呼び出し */
case class ECall(t: T, f: E, ps: List[E]) extends E
/** 関数 */
case class EFun(t: T, id: String, prms: Map[String, T], body: E) extends E
/** if 式 */
case class EIf(t: T, e: E, a: E, b: E) extends E
/** while 文 */
case class EWhile(t: T, e: E, s: E) extends E
/** do while 文 */
case class EDo(t: T, s: List[E], e: E) extends E
/** for文 */
case class EFor(t: T, i: E, c: E, n: E, s: E) extends E
/** switch文 */
case class ESwitch(t: T, i: E, ls: List[(E, E)]) extends E
/** ジャンプ */
case class EGoto(t: T, i: String) extends E
/** ラベル */
case class ELabel(t: T, i: String, e: E) extends E
/** break */
case class EBreak(t: T) extends E
/** continue */
case class EContinue(t: T) extends E
/** ケース */
case class ECase(t: T, a: E, e: E) extends E
/** サイズ取得 */
case class ESizeOf(t: T, t2: T, a: E) extends E
/** リターン */
case class ERet(t: T, a: E) extends E
/** キャスト */
case class ECast(t: T, a: E) extends E
/** 多値 */
case class ETuple(t: T, a: List[E]) extends E
/** 多値 */
case class EImport(id: String) extends E { val t = Tv }
/**
 * 抽象構文木のルート
 */
case class Prog(b: List[E])

// 補助関数

/**
 * プリント関数の呼び出し
 */
object EPrint {
  def apply(t: T, e: E): E = {
    ECall(Tv, EId(TFun(Tv, List(t)), "print_" + tName(t)), List(e))
  }
}

/**
 * 二項演算子の構築用
 */
class EOp(op: String) {
  def apply(t: T, a: E, b: E): EBin = {
    EBin(t, t, op, a, b)
  }
}

/**
 * 比較演算子の構築
 */
class EOpc(op: String) {
  def apply(t: T, a: E, b: E): EBin = {
    EBin(Ti(64), t, op, a, b)
  }
}

/** 加算 */
object EAdd extends EOp("add")
/** 減算算 */
object ESub extends EOp("sub")
/** 乗算 */
object EMul extends EOp("mul")
/** 割算 */
object EDiv extends EOp("div")
/** 剰余 */
object EMod extends EOp("mod")
/** 左シフト */
object EShl extends EOp("shl")
/** 算術右シフト */
object EShr extends EOp("shr")
/** 右シフト */
object EUshr extends EOp("ushr")
/** 論理積 */
object EAnd extends EOp("and")
/** 論理和 */
object EOr extends EOp("or")
/** 排他的論理和 */
object EXor extends EOp("xor")
/** <=比較演算子 */
object EGe extends EOpc("ge")
/** <比較演算子 */
object EGt extends EOpc("gt")
/** &lt;=比較演算子 */
object ELe extends EOpc("le")
/** >比較演算子 */
object ELt extends EOpc("lt")
/** `==`比較演算子 */
object EEq extends EOpc("eq")
/** !=比較演算子 */
object ENe extends EOpc("ne")
