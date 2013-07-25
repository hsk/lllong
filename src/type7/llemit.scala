package type7

import scala.collection.immutable.ListMap
import scala.collection.mutable.ArrayBuffer

/**
 * LLVM変数
 */
sealed trait R {
  def t: T
  def id: String
}

/** グローバル変数 */
case class RG(t: T, id: String) extends R
/** ローカル変数 */
case class RL(t: T, id: String) extends R
/** レジスタ変数 */
case class RR(t: T, id: String) extends R
/** 数値変数 */
case class RN(t: T, id: String) extends R

/**
 * LLVM命令
 */
sealed trait LL

/** 関数コール */
case class LLCall(r: R, op: R, prms: List[R]) extends LL
/** 二項演算子 */
case class LLBin(r: R, op: String, a: R, b: R) extends LL
/** 単項演算子 */
case class LLUnary(r: R, op: String, a: R) extends LL
/** 代入演算子疑似命令 */
case class LLAssign(r: R, b: R) extends LL
/** 値読込 */
case class LLLoad(r: R, b: R) extends LL
/** 値設定 */
case class LLStore(r: R, b: R) extends LL
/** スタック上のメモリ確保 */
case class LLAlloca(a: R) extends LL
/**
 * キャスト全般疑似命令
 * 
 * LLVMのキャストは色々あるのだけど、１つに纏めてあります。
 */
case class LLCast(a: R, b: R) extends LL
/** フィールドアクセス疑似命令 */
case class LLField(id1: R, aid: R, z: R, b: R) extends LL
/** 関数 */
case class LLFun(t: T, n: String, p: Map[String, T], env: Map[String, T], ls: ArrayBuffer[LL], r: R) extends LL
/** コメント */
case class LLNop(s: String) extends LL
/** 条件分岐 */
case class LLJne(r: R, label: String, jmp1: String, jmp2: String) extends LL
/** ジャンプ命令 */
case class LLGoto(label: String, jmp: String) extends LL
/** ラベル命令 */
case class LLLabel(jmp: String, label: String) extends LL
/** SSA最適化のφ(ファイ) 複数基本ブロックの変数を１つに合流させる */
case class LLPhi(reg: R, l1: String, l2: String, t: T, r1: R, r2: R) extends LL
/** テーブルジャンプ命令 */
case class LLSwitch(reg: R, label: String, cases: List[(R, String)]) extends LL
/** グローバル変数 */
case class LLGlobal(id: R, e: R) extends LL
/** 文字列疑似命令　ローカルに書けるような感じにしてありますが、emitで、関数の外に文字列定数を出力し参照します。 */
case class LLLoadCStr(reg: R, i: String) extends LL

/**
 * LLVMコードジェネレータ
 */
object llemit {

  /**
   * 定数リスト
   */
  private var consts = List[Any]()

  /**
   * 型をLLVM用に出力
   */
  def p(t: T): String = {
    t match {
      case Tn => "i8"
      case Ti(i) => "i" + i
      case Tu(i) => "i" + i
      case Tf => "float"
      case Td => "double"
      case Tv => "void"
      case TFun(t, ls) => p(t) + "(" + ls.map(p).mkString(", ") + ")*"
      case TArr(t, size) => "[" + size + " x " + p(t) + "]"
      case Tr(t) => p(t)
      case Tp(t) => p(t) + "*"
      case TDef(id) => p(env.stripType(t))
      case t @ TStr(ls) =>
        if (!global_env.structs.contains(t)) {
          global_env.structs = global_env.structs + (t -> RL(t, genid(".struct")))
          for ((_, t) <- ls) {
            p(t)
          }
        }
        p(global_env.structs(t))
    }
  }

  /**
   * 配列はポインタに変換して型を文字列として出力します。
   */
  private def p2(t: T): String = {
    def f(t: T): T = t match {
      case TArr(t, s) => Tp(f(t))
      case TDef(s) => f(env.find(s))
      case t => t
    }
    p(f(t))
  }

  /**
   * 変数をLLVM用に出力
   */
  private def p(r: R): String = {
    r match {
      case RG(t, id) => "@" + id
      case RL(t, id) => "%" + id
      case RR(t, id) => "%." + id
      case RN(Tf, id) => "0x" + java.lang.Double.doubleToLongBits(id.toFloat.toDouble).toHexString
      case RN(Td, id) => "0x" + java.lang.Double.doubleToLongBits(id.toDouble).toHexString
      case RN(t, id) => "" + id
    }
  }

  /**
   * `=` 付きの出力をします。
   * 
   * rがnullかどうかチェックしてnullだった場合は`=`なしで出力し、nullでなければ`=`ありで出力します。
   */
  private def p(r: R, out: String) {
    if (r != null) asm.p(p(r) + " = " + out)
    else asm.p(out)
  }

  /**
   * LL出力
   * 
   * 引数lをファイルに出力します。
   */
  private def output(l: LL) {
    l match {
      case LLCall(id, op, prms) =>

        val r = op match {
          case RL(Tp(t), _) => val r = kNormal.genRL(t); p(r, "load " + p(Tp(t)) + " " + p(op)); r
          case _ => op
        }

        val ps = prms.map { case a => p(a.t) + " " + p(a) }.mkString(", ")

        id.t match {
          case Tv => asm.p("call " + p2(id.t) + " " + p(r) + "(" + ps + ") nounwind ssp")
          case _ => p(id, "call " + p2(id.t) + " " + p(r) + "(" + ps + ") nounwind ssp")
        }

      case LLUnary(id, op, a) =>

        (a.t, op) match {
          case (_: Ti, "not") =>
            val r = kNormal.genRL(Ti(1))
            p(r, "icmp eq " + p(a.t) + " 0, " + " " + p(a))
            p(id, "zext i1 " + p(r) + " to " + p(id.t))
          case (_: Ti, "neg") => p(id, "sub " + p(a.t) + " 0, " + p(a))
          case (Tf, "neg") | (Td, "neg") => p(id, "fsub " + p(a.t) + " 0.0, " + p(a))
          case _ => throw new Exception("error " + l)
        }

      case LLBin(r, op, a, b) =>
        (a.t, op) match {

          case (Tp(t), "add") =>
            // TODO: 型推論の際にcastを入れなくする
            val id2 = genid("%..")
            asm.p(id2 + " = ptrtoint " + p(b.t) + " " + p(b) + " to " + p(Ti(64)))
            p(r, "getelementptr inbounds " + p(a.t) + " " + p(a) + ", " + p(Ti(64)) + " " + id2)

          case (Tp(t), "sub") =>
            // TODO: 型推論の際にcastを入れなくする
            val id2 = genid("%..")
            val id3 = genid("%..")
            asm.p(id2 + " = ptrtoint " + p(b.t) + " " + p(b) + " to " + p(Ti(64)))
            asm.p(id3 + " = sub " + p(Ti(64)) + " 0, " + id2)
            p(r, "getelementptr inbounds " + p(a.t) + " " + p(a) + ", " + p(Ti(64)) + " " + id3)

          case (Tf, _) | (Td, _) =>
            op match {
              case "lt" | "le" | "gt" | "ge" =>
                val r2 = kNormal.genRL(Ti(1))
                p(r2, "fcmp o" + op + " " + p(a.t) + " " + p(a) + ", " + p(b))
                p(r, "zext i1 " + p(r2) + " to i64")
              case _ =>
                p(r, "f" + op + " " + p(r.t) + " " + p(a) + ", " + p(b))
            }
          case (Ti(_), "div") => p(r, "sdiv " + p(r.t) + " " + p(a) + ", " + p(b))
          case (Ti(_), "mod") => p(r, "srem " + p(r.t) + " " + p(a) + ", " + p(b))
          case (Ti(_), "shr") => p(r, "ashr " + p(r.t) + " " + p(a) + ", " + p(b))
          case (Ti(_), "ushr") => p(r, "lshr " + p(r.t) + " " + p(a) + ", " + p(b))
          case _ =>
            op match {
              case "eq" | "ne" =>
                val r2 = kNormal.genRL(Ti(1))
                p(r2, "icmp " + op + " " + p(a.t) + " " + p(a) + ", " + p(b))
                p(r, "zext i1 " + p(r2) + " to i64")
              case "lt" | "le" | "gt" | "ge" =>
                val r2 = kNormal.genRL(Ti(1))
                p(r2, "icmp s" + op + " " + p(a.t) + " " + p(a) + ", " + p(b))
                p(r, "zext i1 " + p(r2) + " to i64")
              case _ =>
                p(r, op + " " + p(r.t) + " " + p(a) + ", " + p(b))
            }

        }

      case LLLoad(r: R, s: R) =>
        p(r, "load " + p(s.t) + " " + p(s))

      case LLStore(s: R, r: R) =>
        asm.p("store " + p(s.t) + " " + p(s) + ", " + p(r.t) + " " + p(r))

      case LLAlloca(r: R) =>
        p(r, "alloca " + p(r.t))

      case LLField(r: R, addr: R, null, a: R) =>
        p(r, "getelementptr inbounds " + p(addr.t) + " " + p(addr) + ", " + p(a.t) + " " + p(a))

      case LLField(r: R, addr: R, zero: R, a: R) =>
        env.stripType(addr.t) match {
          case Tp(tt) if (!tt.isInstanceOf[TArr] && !tt.isInstanceOf[TStr]) =>
            p(r, "getelementptr inbounds " + p(addr.t) + " " + p(addr) + ", " + p(a.t) + " " + p(a))
          case _ =>
            p(r, "getelementptr inbounds " + p(addr.t) + " " + p(addr) + ", " + p(zero.t) + " " + p(zero) + ", " + p(a.t) + " " + p(a))
        }

      case LLFun(t, n, ps, m, ls, r) =>
        consts = List()
        completeds = completeds + n
        asm.apply("define " + p(t) + " @" + n + "(" + ps.map { case (a, t) => p(t) + " %" + a + ".v" }.mkString(", ") + ") nounwind ssp {")
        asm.apply("entry:")
        ls.foreach(output)
        (env.stripType(t), r) match {
          case (_, null) | (Tv, _) => asm.p("ret " + p(t))
          case _ =>
            asm.p("store " + p(t) + " " + p(r) + ", " + p(Tp(t)) + " %..retVal")
            asm.p("br label %..leave")
            asm.apply("..leave:")
            val r2 = kNormal.genRL(t)
            p(r2, "load " + p(Tp(t)) + " %..retVal")
            asm.p("ret " + p(t) + " " + p(r2))
        }
        asm.apply("}")
        consts.foreach {
          case (id, asc: String, t) =>
            asm.apply("@." + id + "= private constant " + t + " c\"" + asc.replaceAll("\\\\","\\\\\\\\").replaceAll("\"","\\\\"+('"').toInt.toHexString) + "\\00\"")
          case (id, a, t) =>
            asm.apply("@." + id + "= private constant " + t + " " + a)
        }

      case LLCast(r: R, b: R) =>
        (env.stripType(r.t), env.stripType(b.t)) match {
          case (Tp(t), Tp(_)) =>
            p(r, "bitcast " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (Tp(t), _) => p(r, "inttoptr " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (Tf, Td) =>
            p(r, "fptrunc " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (Td, Td) | (Td, Tf) | (Tf, Td) | (Tf, Tf) =>
            p(r, "fpext " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (Td, _: Ti) | (Tf, _: Ti) =>
            p(r, "sitofp " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (_: Ti, Td) | (_: Ti, Tf) =>
            p(r, "fptosi " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (Td, _: Tu) | (Tf, _: Tu) =>
            p(r, "uitofp " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case (_: Tu, Td) | (_: Tu, Tf) =>
            p(r, "fptoui " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case _ if (env.size(r.t) == env.size(b.t)) =>
            p(r, "bitcast " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case _ if (env.size(r.t) > env.size(b.t)) =>
            p(r, "zext " + p(b.t) + " " + p(b) + " to " + p(r.t))
          case _ =>
            p(r, "trunc " + p(b.t) + " " + p(b) + " to " + p(r.t))
        }

      case LLNop(s: String) =>
        asm.p("; " + s)

      case LLJne(r: R, label: String, jmp1: String, jmp2: String) =>
        val reg = genid("%reg_")
        asm.p(reg + " = icmp ne " + p(r.t) + " " + p(r) + ", 0")
        asm.p("br i1 " + reg + ", label %" + jmp1 + ", label %" + jmp2)
        asm.apply(label + ":")

      case LLGoto(label, jmp: String) =>
        asm.p("br label %" + jmp)
        if (label != null) asm.apply(label + ":")

      case LLLabel(jmp, label: String) =>
        if (jmp != null) asm.p("br label %" + jmp)
        asm.apply(label + ":")

      case LLPhi(r: R, l1: String, l2: String, t: T, r1: R, r2: R) =>
        p(r, "phi " + p(t) + " [" + p(r1) + ", %" + l1 + "], [" + p(r2) + ", %" + l2 + "]")

      case LLSwitch(n, lbl, cases) =>
        asm.p("switch " + p(n.t) + " " + p(n) + ", label %" + lbl + " [")
        for ((a, b) <- cases) {
          asm.p("  " + p(n.t) + " " + p(a) + ", label %" + b)
        }
        asm.p("]")

      case LLLoadCStr(r: R, a: String) =>
        val t = TArr(Ti(8), a.getBytes("UTF-8").length + 1)
        val id = genid("str")
        llemit.consts = (id, a, p(t)) :: llemit.consts
        p(r, "bitcast " + p(Tp(t)) + " @." + id + " to i8*")

      case LLGlobal(r, v) =>
        completeds = completeds + r.id
        if (v == null)
          asm(p(r) + "= common global " + p(r.t) + " zeroinitializer")
        else
          asm(p(r) + "= global " + p(r.t) + " " + p(v))
    }
  }

  /** 出力完了関数リスト */
  private var completeds = Set[String]()

  /**
   * llemitのエントリポイント
   * 
   * @param file: String 出力ファイル名
   * @param ls: ArrayBuffer[LL] 出力LLVM命令リスト
   */
  def apply(file: String, ls: ArrayBuffer[LL]) {
    completeds = Set[String]()
    asm.open(file)

    for ((TStr(ls), r) <- global_env.structs) {
      asm.apply(p(r) + " = type { " + ls.map { case (_, t) => p(t) }.mkString(", ") + " }");
    }

    asm.apply("declare i32 @printf(i8*, ...) nounwind")
    ls.foreach(output)

    for ((id, t) <- global_env.map) {
      if (!completeds.contains(id)) {
        t match {
          case TFun(t, p1) =>
            asm("declare " + p(t) + " @" + id + "(" + p1.map { t => p2(t) }.mkString(", ") + ") nounwind")
          case _ =>
            asm("@"+id+" = external global "+p(t))
        }
      }
    }

    asm.close()

  }

}
