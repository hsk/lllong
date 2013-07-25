package type7

import scala.collection.mutable.ArrayBuffer

/**
 * 定数畳み込みクラス
 *
 * 例) a=1+2 f(a)を f(3)に書き換えます。
 */
class constFold(parent: constFold) {

  /** 定数畳込用の環境 */
  private var map: Map[String, R] = Map()

  /**
   * 畳み込み処理の本体
   * 
   * @param ls: ArrayBuffer[LL] LLリスト
   * @return ArrayBuffer[LL] 畳み込み後のリスト
   */
  def fold(ls: ArrayBuffer[LL]): ArrayBuffer[LL] = {

    /** 出力用バッファ */
    val outputBuffer = new ArrayBuffer[LL]
  
    /**
     * 出力
     */
    def add(ll:LL) {
      outputBuffer.append(ll)
    }

    for (l <- ls) {
      l match {
        case l @ LLCall(id, op, prms) => add(l.copy(prms = expandList(prms)))
        case l @ LLBin(id, op, a, b) =>
          val a1 = expand(a)
          val b1 = expand(b)
          (op, a1, b1) match {
            case ("sub", RN(Ti(_), a), RN(Ti(_), b)) => map = map + (id.id -> RN(id.t, (a.toLong - b.toLong) + ""))
            case ("add", RN(Ti(_), a), RN(Ti(_), b)) => map = map + (id.id -> RN(id.t, (a.toLong + b.toLong) + ""))
            case ("mul", RN(Ti(_), a), RN(Ti(_), b)) => map = map + (id.id -> RN(id.t, (a.toLong * b.toLong) + ""))
            case _ => add(l.copy(a = a1, b = b1))
          }

        case l @ LLUnary(_, _, a) => add(l.copy(a = expand(a)))
        case l @ LLAssign(s, d) => map = map + (s.id -> d)
        case l @ LLAlloca(id: R) => add(l.copy(expand(id)))
        case l @ LLField(id, id2, id3, id4) => add(l.copy(id, expand(id2), expand(id3), expand(id4)))
        case l @ LLStore(id1, id2) => add(l.copy(expand(id1), expand(id2)))
        case l @ LLLoad(id1, id2) =>
          val id22 = stripPointerT(expand(id2))
          if (expand(id2) != id2) {
            map = map + (id1.id -> id22)
            id22
          } else {
            add(l.copy(expand(id1), expand(id2)))
          }
        case l @ LLCast(did, sid) => add(l.copy(expand(did), expand(sid)))
        case l @ LLSwitch(n, lbl, cases: List[(R, String)]) => add(l.copy(expand(n), lbl, cases.map { case (r, s) => (expand(r), s) }))
        case l: LLLabel => add(l)
        case l: LLGoto => add(l)
        case l @ LLFun(t, n, p, env, ls, r) =>
          val cf = new constFold(this)
          add(l.copy(ls = cf.fold(ls), r = cf.expand(r)))
        case l: LLNop => add(l)
        case l @ LLJne(r, _, _, _) => add(l.copy(expand(r)))
        case l @ LLPhi(reg: R, l1: String, l2: String, t: T, r1: R, r2: R) => add(l.copy(reg = expand(reg), r1 = expand(r1), r2 = expand(r2)))
        case l @ LLGlobal(s, d) => add(l)
          /*
          kNormal.tName2(s.t) match {
            case "" => map = map + (s.id -> d)
            case _ =>
          }
          add(l)*/
        case l: LLLoadCStr => add(l)
        case l => throw new Exception("error no implementation " + l)
      }
    }
    outputBuffer
  }

  /**
   * 型の変換
   *
   * ポインタの型は内部の型を取り出して返却します。
   */
  private def stripPointerT(a: R): R = {
    kNormal.tName2(a.t) match {
      case "a" | "p" if (map.contains(a.id)) =>
        env.stripType(map(a.id).t) match {
          case t @ Tp(t2) => kNormal.setT(a, t2)
          case t @ Tr(t2) => kNormal.setT(a, t2)
          case t @ TArr(t2, _) => kNormal.setT(a, t2)
          case t: TFun => a
          case t => a
        }
      case t => a
    }
  }

  /**
   * レジスタ展開
   * 
   * 環境にRがあれば、そのRを返しなければ、引数をそのまま返します。
   * 親の環境も検索します。
   */
  private def expand(v: R): R = {
    if (v == null) v
    else if (map.contains(v.id)) expand(map(v.id))
    else if (parent == null) v
    else parent.expand(v)
  }

  /**
   * Rのリストを展開します
   */
  private def expandList(prms: List[R]): List[R] = {
    prms.map {
      case v => expand(v)
    }
  }
}

/**
 * 定数畳み込み処理
 */
object constFold {

  /**
   * エントリポイント
   */
  def apply(ls: ArrayBuffer[LL]): ArrayBuffer[LL] = {
    new constFold(null).fold(ls)
  }
}
