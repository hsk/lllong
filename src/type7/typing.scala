package type7

import util.parsing.input.{ Position }
import scala.collection.immutable.ListMap
import java.io.FileInputStream

/**
 * 型エラー
 */
case class TypeError(p: Position, msg: String) extends Exception(msg) {
  override def toString() = env.filename + "(" + p + "): " + msg
}

/**
 * 型チェック
 */
object typing {

  /**
   * 型チェック本体
   */
  def apply(e: Prog): Prog = {
    // 初期化
    env.init()
    // グローバルな型をチェック
    checkGlobalType(e)
    // 型をチェック、チェック、ダブルチェックだ。ぜんぜんチェックしてないけど。上からと下からチェックで正確になるんでしょうねと。
    // で、横のつながりを持たせるには、型変数を導入してやって、情報伝達してやるといいわけだけけど、そこまではしない方針ですっと。
    Prog(e.b.map { typingGlobal(_) })
  }

  /**
   * グローバルな型チェック
   *
   * グローバルな関数と変数を環境テーブルに保存します。
   *
   * 先に型を調べる事で、前方参照が可能になります。前方とはソースコードの下方向です。
   * 使用する前に定義されていない型を使えるようにするために、先にソース全体の型だけチェックしてしまいます。
   */
  def checkGlobalType(e: Prog) {
    e.b.foreach {
      // 関数の型を環境に保存
      case EFun(t, n, p, b) =>
        global_env.add(n, TFun(t, p.toList.map { case (id, t) => t }))
      // 型の宣言を環境に保存
      case ETypeDef(t, id) => global_env.addTypeDef(id, t)
      // 型の指定のないグローバル変数は式の型を変数の型にして環境に保存
      case EVar(Tn, a, c) =>
        val c2 = typingLocal(Tn, c)
        global_env.add(a, c2.t)
      // 変数を環境に保存
      case EVar(t, id, a) =>
        global_env.add(id, t)
      case EVal(Tn, a, c) =>
        val c2 = typingLocal(Tn, c)
        global_env.add(a, c2.t)
      // 変数を環境に保存
      case EVal(t, id, a) =>
        global_env.add(id, t)

      // 何かの残骸は読み捨て
      case e: ENop =>
      case EImport(id) => main2.importFile(id + ".lll")

      case e =>
        throw new TypeError(e.pos, "syntax error found unexpected expression in global scope " + e)
    }
  }

  private var funType: T = null

  /*
   * トップレベルの型付け
   * function以外は環境に取り込み済みなので、関数内部のみ処理する
   * 
   * @param e: E
   * @return E
   */
  private def typingGlobal(e: E): E = {
    println("f " + e)
    e match {
      case e @ EFun(t: T, id: String, p1: Map[String, T], b: E) =>
        // 関数の型で環境を初期化
        env.init(p1)
        funType = t // 関数の型チェック用。
        val b2 = typingLocal(t, b)
        (t, b2.t) match {
          case (Tv, a) => // voidならどんな型でも後でpopするのでok TODO: ここでpopを入れる事の検討
          case (t, Tr(a)) =>
            if (t != a) {
              throw TypeError(e.pos, "error function " + id +
                " type error type=" + ttos(t) + " return type " + ttos(b2.t) + " " + b2)
            }
          case (t, a) =>
            if (t != a) {
              throw TypeError(e.pos, "error function " + id +
                " type error type=" + ttos(t) + " return type " + ttos(b2.t) + " " + b2)
            }
        }
        p(e, e.copy(t, id, p1, b2))
      // TODO: 関数の型が未定義なら、コピーすると型推論出来るので推論できるけど、定義がないので困るので推論しない。
      case ea @ EVar(t: T, id: String, null) => // ローカル環境に型を保存する
        if (env.map.getOrElse(id, null) != null) {
          throw TypeError(e.pos, id + " is already defined env " + env.map)
        }
        // これはtypedefではないのだけど、addtypedefになってるけど、addはローカル変数のアドレス計算もするのでコレで宵。
        // TODO: もしかすると、addでタイプを保存して、addVarで変数の計算ってやったほうがいいのかも。
        global_env.add(id, t); e

      // var a = 1 
      case ea @ EVar(t, b, c) =>
        val (b1, t1, e1) = typingGlobalVar(EVar(_, _, _), ea, t, b, c)
        global_env.add(b1, t1)
        e1
      case ea @ EVal(t, b, c) =>
        val (b1, t1, e1) = typingGlobalVar(EVal(_, _, _), ea, t, b, c)
        global_env.add(b1, t1)
        e1
      case _: EImport => e // スルー
      case e: ETypeDef => e
      case e: ENop => e
      case e => throw new Exception("error " + e) // スルー
    }
  }

  private def typingGlobalVar(ecopy: (T, String, E) => E, ea: E, t: T, b: String, c: E): (String, T, E) = {
    if (env.map.getOrElse(b, null) != null) {
      throw TypeError(ea.pos, b + " is already defined ")
    }

    (t, b, c) match {
      case (Tn, b, c) =>
        val c2 = typingLocal(Ti(64), c)
        (b, c2.t, p(ea, ecopy(c2.t, b, c2)))

      // var a:int = 1 型が決まっている整数
      case (t, a, ed @ ELd(_, c)) =>
        (a, t, p(ea, ecopy(t, a, p(ed, ed.copy(t, c)))))

      // var a:float = 1.0 固定のdouble値
      case (t, a, ed @ ELdd(_, c)) =>
        (a, t, p(ea, ecopy(t, a, p(ed, ed.copy(t, c)))))

      // 文字列
      case (t, a, ed @ ELds(_, c)) =>
        (a, t, p(ea, ecopy(t, a, p(ed, ed.copy(t, c)))))

      // タプル
      case (t, a, ed @ ETuple(_, c)) =>
        env.stripType(t) match {
          case t @ TStr(ts) =>
            def cpType(a: List[E], ts: List[(String, T)]): List[E] = {
              (a, ts) match {
                case (List(), List()) => List()
                case (a :: as, (s, t) :: ts) => setT(a, t) :: cpType(as, ts)
                case _ => throw new Exception("error")
              }
            }
            (a, t, p(ea, ecopy(t, a, p(ed, ed.copy(t, cpType(c, ts.toList))))))
          case _ => throw TypeError(ea.pos, a + " type unmatch")
        }
    }
  }

  def p(e: E, e2: E): E = transduce.p(e, e2)
  /**
   * ローカル変数の型付け
   *
   * 式の型が決まっていない場合に、子の型から型を決定する
   * 基本的にトップダウンで末端まで行って型を取得してトップまで合わせるだけになっている。
   * TODO: トップの型とのチェックはしていないので、チェックする
   *
   * @param pt: T
   * @param e: E
   * @return E
   */
  private def typingLocal(pt: T, e: E): E = {
    e match {
      case e @ EFun(t: T, id: String, p: Map[String, T], b: E) =>
        // 関数内関数はエラー
        throw TypeError(e.pos, "inner function is not supported")
      case ETypeDef(t: T, id: String) => // ローカル環境に型を保存する。
        if (env.map.getOrElse(id, null) != null) {
          throw TypeError(e.pos, id + " is already defined")
        }
        env.addTypeDef(id, t)
        e
      case EVar(t: T, a: String, null) => // ローカル環境に型を保存する
        if (env.map.getOrElse(a, null) != null) {
          throw TypeError(e.pos, a + " is already defined ")
        }
        // これはtypedefではないのだけど、addtypedefになってるけど、addはローカル変数のアドレス計算もするのでコレでok
        env.addTypeDef(a, t); e
      // 配列リテラル
      case ea @ EVar(t, a, c @ ECall(_, eda @ EId(_, "Array"), ls)) =>
        if (env.map.getOrElse(a, null) != null) {
          throw TypeError(e.pos, a + " is already defined ")
        }
        val (tt, t1) = t match {
          case t @ TArr(t1, size) =>
            if (size != ls.size) {
              throw TypeError(e.pos, "array size dont match")
            }
            (t, t1)
          case Tn =>
            val t1 = typingLocal(Tn, ls(0)).t; (TArr(t1, ls.size), t1)
          case _ => throw new Exception("error")
        }
        val (n, l) = ls.foldLeft((0, List[E]())) {
          case ((i, l), a1) =>
            (i + 1, p(ea, EAssign(t1, p(ea, EArray(t1, p(ea, EId(tt, a)), ELd(Ti(32), i))), typingLocal(t1, a1))) :: l)
        }
        env.addTypeDef(a, tt)
        EBlock(t, p(ea, ea.copy(tt, a, null)) :: (l.reverse))

      // var a = 1 型推論
      case ea @ EVar(Tn, a, c) =>
        if (env.map.getOrElse(a, null) != null) {
          throw TypeError(e.pos, a + " is already defined ")
        }
        val c2 = typingLocal(pt, c)
        env.addTypeDef(a, c2.t)
        p(ea, ea.copy(c2.t, a, c2))
      // var a:t = f
      case ea @ EVar(t, a, c) =>
        //if (env.map.getOrElse(a, null) != null) {
        //  throw TypeError(e.pos, a + " is already defined ")
        //}
        env.addTypeDef(a, t)
        p(ea, ea.copy(t, a, c match {
          case c: ELdd => p(c, c.copy(t = t))
          case c: ELd => p(c, c.copy(t = t))
          case _ =>
            val c2 = typingLocal(pt, c)
            if (t != c2.t) throw TypeError(e.pos, "type match error")
            c2
        }))

      // ここからが文。式との違いは、親が値を求めていないかもしれないと言う事で、必要ない時は値を消す処理をどこかでする必要がある。
      // 親が求めている型は分からないので何ともならないけどw
      // 親が求める型に合わせて、popする式を入れるのは手だろうなと思うのと、そうするとよりunifyな感じになるよなと。
      case e @ EBlock(_, b: List[E]) =>
        import scala.annotation.tailrec
        @tailrec
        def loop(l: List[E], r: List[E]): E = l match {
          case List(x) =>
            val y = typingLocal(pt, x); p(e, e.copy(y.t, (y :: r).reverse)) // 最後の値をブロックの型にする
          case x :: xs => loop(xs, typingLocal(Tv, x) :: r)
        }
        loop(b, List())

      case e1 @ EWhile(t: T, e: E, s: E) =>
        p(e1, e1.copy(Tv, typingLocal(Tv, e), typingLocal(Tv, s)))
      case e @ EFor(t: T, i: E, c: E, n: E, s: E) =>
        p(e, e.copy(Tv, typingLocal(Tv, i), typingLocal(Ti(64), c), typingLocal(Tv, n), typingLocal(pt, s)))
      case e @ EDo(t: T, a: List[E], b: E) =>
        p(e, e.copy(Tv, a.map { e => typingLocal(Tv, e) }, typingLocal(Ti(64), b)))
      case e @ ESwitch(t: T, a: E, b: List[(E, E)]) =>
        // switchの値は最後のブロックの値にしてみてるけどテストが甘いはず breakがあるから,voidにしておく
        val a2 = typingLocal(Tn, a)
        val b2 = b.map {
          case (a, e) =>
            val a3 = typingLocal(a2.t, a)
            val e2 = typingLocal(Tv, e)
            (a3, e2)
        }
        p(e, e.copy(Tv, a2, b2))
      case e @ EIf(_, a: E, b: E, c: E) =>
        val a2 = typingLocal(Ti(64), a)
        val b2 = typingLocal(Tn, b)
        val c2 = typingLocal(Tn, c)
        val t = (b2.t, c2.t) match {
          // ifの型は片方がvoidならvoid
          case (Tv, _) => Tv
          case (_, Tv) => Tv
          // trならtrじゃないほう
          case (_: Tr, b) if (!b.isInstanceOf[Tr]) => b
          case (a, _: Tr) if (!a.isInstanceOf[Tr]) => a
          // aとbが違う型のときもvoid // castできたとしてもvoid
          case (a, b) => if (a == b) a else Tv
        }
        p(e, e.copy(t, ECast(Ti(64), a2), b2, c2)) // 位置情報もコピーされる

      // voidはない copy使って位置情報も全部コピー
      // 決まって無い時はlong. intじゃないの？って話もあるけど、64bitだしlong
      // 決まってたらそのまま
      case e @ ELd(t, i: Long) =>
        (pt, t) match {
          case (Tv, Tn) => p(e, e.copy(t = Ti(64)))
          case (Tn, Tn) => p(e, e.copy(t = Ti(64)))
          case (Ti(i), Tn) => p(e, e.copy(t = pt))
          case _ => e
        }
      // double
      case e @ ELdd(t, i: Double) =>
        (pt, t) match {
          case (Tv, Tn) => p(e, e.copy(t = Td))
          case (Tn, Tn) => p(e, e.copy(t = Td))
          case (Tf, Tn) | (Td, Tn) => p(e, e.copy(t = pt))
          case (_, Tn) => p(e, e.copy(t = Td))
          case _ => e
        }
      case e @ ELds(t, i: String) =>
        val pt2 = env.stripType(pt)
        (pt2, t) match {
          case (Tv, Tn) => p(e, e.copy(t = Tp(Ti(8))))
          case (Tn, Tn) => p(e, e.copy(t = Tp(Ti(8))))
          case (Tp(Ti(8)), Tn) => p(e, e.copy(t = pt))
          case (Tp(Tu(8)), Tn) => p(e, e.copy(t = pt))
          case _ =>
            throw new Exception("dame " + pt2 + " " + t + "global_env.map" + global_env.map)
            e
        }
      case e @ ENeg(t: T, a: E) =>
        val a2 = typingLocal(pt, a); p(e, e.copy(a2.t, a2))
      case e @ EBin(t: T, it: T, i, a: E, b: E) =>
        autoCastBinT(e, typingLocal(pt, a), typingLocal(pt, b))
      case e @ EAssign(t, a: E, b: E) =>
        println("Eassign " + e)
        unifyBinT(e, typingLocal(pt, a), typingLocal(pt, b))
      case e @ ENot(t: T, a: E) =>
        val a2 = typingLocal(Ti(64), a); p(e, e.copy(a2.t, a2))
      case ESizeOf(_, _, null) => e
      case e @ ESizeOf(_, _, a) =>
        val a2 = typingLocal(Ti(64), a); p(e, e.copy(Ti(64), a2.t, null))
      case e @ ENewArray(t: T, a: E) => p(e, e.copy(t, typingLocal(Ti(64), a)))
      case ENew(t: T) => e
      case EGCNew(t: T) => e
      case e @ ERef(t: T, a: E) =>
        val a2 = typingLocal(Tn, a); p(e, e.copy(Tp(a2.t), a2))
      case e @ EPtr(t: T, a: E) =>
        val a2 = typingLocal(Tn, a);
        env.stripType(a2.t) match {
          case Tp(t) => p(e, e.copy(t, a2))
          case TArr(t, _) => p(e, e.copy(t, a2))
          case t => throw new Exception("error " + t)
        }
      case e @ EGoto(t: T, a: String) => p(e, e.copy(Tv, a))
      case e @ ELabel(t: T, a: String, b) =>
        val b2 = typingLocal(Tn, b); p(e, e.copy(b2.t, a, b2))
      case e @ ECase(t: T, null, b) => e
      case e @ ECase(t: T, a, b) =>
        val a2 = typingLocal(pt, a)
        if (a2.t != pt) {
          p(e, e.copy(pt, ECast(pt, a2), b))
        } else {
          p(e, e.copy(a2.t, a2, b))
        }
      case ENop(t: T, s: String) => e
      case EBreak(t: T) => e
      case EContinue(t: T) => e
      case e @ ECast(t: T, a) => p(e, e.copy(t, typingLocal(Tn, a)))
      case ERet(t: T, a: E) =>
        val a2 = typingLocal(funType, a)
        if (funType != a2.t) {
          throw TypeError(e.pos, "return type error. expected type is " +
            ttos(funType) + " but found " + ttos(a2.t) + " " + e)
        }
        ERet(Tr(a2.t), a2)
      // 変数
      case e @ EId(t, id: String) =>
        t match {
          case Tn =>
            val t2 = env.map.getOrElse(id, global_env.map.getOrElse(id, Tn))
            // 型が決まらなかったらエラー
            if (t2 == Tn) {
              throw TypeError(e.pos, "found undefined id '" + id + "'")
            }
            p(e, e.copy(t = t2))
          case _ => e
        }

      case e @ EArray(t: T, id: E, idx: E) =>
        val id2 = typingLocal(Tn, id)
        def aa(t: T): T = t match {
          case TDef(n) => aa(env.map(n))
          case TArr(t, s) => t
          case Tp(t) => t
          case t => t
        }
        p(e, e.copy(aa(id2.t), id2, typingLocal(Ti(64), idx)))

      case e @ EField(t: T, t1, a: E, id: String) =>
        val a2 = typingLocal(t1, a)

        def f(t: T): T = t match {
          case TDef(id) => f(env.find(id))
          case TStr(m) =>
            if (!m.contains(id)) {
              throw TypeError(e.pos, "has not have " + a2.t + " " + id)
            }
            m(id)
          case t @ Tp(t1) => f(t1)
          case _ => throw new Exception("error")
        }
        p(e, e.copy(f(a2.t), a2.t, a2, id))

      case e @ EArrow(t1: T, tt: T, a: E, id: String) =>
        val a2 = typingLocal(Tn, a)
        // 親元の型を調べる
        env.stripType(a2.t) match {
          // 構造体のポインタのとき
          case Tp(t: TStr) =>
            // 矢印演算子
            def findStruct(t: TStr, a2: E): E = {
              if (t.members.contains(id)) {
                return p(e, e.copy(t.members(id), t, a2, id))
              }
              if (!t.members.contains("classInfo")) {
                throw new Exception("not found structure member " + id + " in " + t.members)
              }
              t.members("classInfo") match {
                case Tp(t1: TStr) => findStruct(t1, EArrow(a2.t, t, a2, "classInfo"))
                case _ => throw new Exception("error")
              }
            }
            findStruct(t, a2)
          case _ => throw new Exception("error")
        }
      case e @ ECall(t: T, a1: E, ls: List[E]) =>
        val a2 = typingLocal(Tn, a1)
        def checkTypes(n: Int, as: List[T], ps: List[E], rs: List[E]): List[E] = {
          (as, ps) match {

            case (List(), List()) => rs
            case (List(), List(ENop(_, _))) => rs
            case (a :: as, p :: ps) =>
              val p2 = typingLocal(a, p)

              if (env.stripType(a) != env.stripType(p2.t)) {
                a1 match {
                  case EId(t, id) =>
                    throw TypeError(a1.pos, n + "th parameter type check error " + id + ":" +
                      ttos(a2.t) + " found:" + ttos(p2.t) + " expected:" + ttos(a))
                  case _ =>
                    throw TypeError(a1.pos, n + "th parameter type check error " + a1 + " " +
                      ttos(a2.t) + " " + ttos(p2.t) + " " + ttos(a))
                }
              }
              checkTypes(n + 1, as, ps, p2 :: rs)
            case _ =>
              throw TypeError(a1.pos, n + "th parameter undefined function " + a1 + " a2.t=" + a2.t)
          }
        }
        val (t2, prms) = a2.t match {
          case TFun(t2, prms) => (t2, prms)
          case Tp(TFun(t2, prms)) => (t2, prms)
          case _ =>
            throw TypeError(a1.pos, "error undefined function " + a1 + " a2.t=" + a2.t)
        }
        p(e, e.copy(t2, a2, checkTypes(1, prms, ls, List()).reverse))
      /*
      case e@ECall(t: T, a: E, ls: List[E]) =>
        val a2 = f(Tn, a)
        a2.t match {
          case TFun(t2, _) =>
              val ls2 = ls.map(f(Tn,_))
              p(e, e.copy(t2, a2, ls2))
          case _ => throw TypeError("error undefined function " + a);
        }*/
    }
  }

  /**
   * 暗黙の型変換付きの型付け処理
   *
   * @param e: Ebin
   * @param a1: E
   * @param b1: E
   * @return E
   */
  private def autoCastBinT(e: EBin, a1: E, b1: E): E = {
    def implicitConversion(a: E, b: E): (E, E) = (a.t, b.t) match {
      case (t1, t2) if (t1 == t2 && Tn != t1) => (a, b)
      case (Td, Tf | Ti(64)) => (a, ECast(Td, b))
      case (Tf | Ti(64), Td) => (ECast(Td, a), b)
      case (Tf, Ti(64)) => (a, ECast(Tf, b))
      case (Ti(64), Tf) => (ECast(Tf, a), b)
      case (t1 @ Tp(_), _) => (a, ECast(t1, b))
      case (_, Tp(_)) => (a, b)
      case (Ti(64), _) => implicitConversion(a, ECast(Ti(64), b))
      case (_, Ti(64)) => implicitConversion(ECast(Ti(64), a), b)
      case (Ti(32), _) => implicitConversion(a, ECast(Ti(32), b))
      case (_, Ti(32)) => implicitConversion(ECast(Ti(32), a), b)
      case (Ti(16), _) => implicitConversion(a, ECast(Ti(16), b))
      case (_, Ti(16)) => implicitConversion(ECast(Ti(16), a), b)
      case _ => (a, b)
    }

    val (a, b) = implicitConversion(a1, b1)

    val e2 = (a.t, b.t) match {
      case (t1, t2) if (t1 == t2) => p(e, e.copy(t = t1, a = a, b = b))
      case (Tp(t1), _) => p(e, e.copy(t = Tp(t1), a = a, b = b))
      case (Tn, t1) =>
        println("kore 1 " + a.pos + " " + b.pos)
        p(e, e.copy(t = t1, a = setT(a, t1), b = b))
      case (t1, Tn) =>
        println("kore 2 " + a.pos + " " + b.pos)
        p(e, e.copy(t = t1, a = a, b = setT(b, t1)))
    }
    // 比較演算子の場合返り値はTlとする
    e2 match {
      case e2 @ EBin(t, _, op, _, _) =>
        op match {
          case "eq" | "ne" | "gt" | "lt" | "ge" | "le" => p(e2, e2.copy(t = Ti(64), it = t))
          case _ => p(e2, e2.copy(it = t))
        }
    }
  }

  /**
   * ２つの式の型を合わせる代入時処理
   *
   * @param f: EAssign
   * @param a: E
   * @param b: E
   * @return E
   */
  private def unifyBinT(f: EAssign, a: E, b: E): E = {
    (a.t, b.t) match {
      // aとbが同じなら親も同じにする
      case (t1, t2) if (env.stripType(t1) == env.stripType(t2)) => p(f, f.copy(t1, a, b))
      // bがlongならaに合わせる a = 1+5 みたいな処理のaがbyteだったら、byteに勝手に変換しちゃうよと。
      case (ta, Ti(64)) => p(f, f.copy(ta, a, ECast(ta, b)))
      // floatとdoubleならfloatにする doubleな値は、変数に合わせてしまう。合わせてしまうのは良いけど、キャスト演算が入ってるの？
      case (Tf, Td) => p(f, f.copy(Tf, a, ECast(Tf, b)))
      // aがポインタなら親もポインタ
      case (Tp(t1), Tn) => p(f, f.copy(Tp(t1), a, b))
      case (Tp(t1), TArr(t2, _)) => p(f, f.copy(Tp(t1), a, b))
      case (Tp(t1), Tp(t2)) if (t1 == t2) => p(f, f.copy(Tp(t1), a, b))
      case (TArr(t1, _), Tp(t2)) if (t1 == t2) => p(f, f.copy(Tp(t1), a, b))
      // 片方の型が決まっていなければコピーする
      case (Tn, t1) =>
        throw TypeError(a.pos, "kore 3  " + b.pos); p(f, f.copy(t1, setT(a, t1), b))
      case (t1, Tn) =>
        throw TypeError(a.pos, "kore 4  " + b.pos); p(f, f.copy(t1, a, setT(b, t1)))
      case (t1, t2) => throw TypeError(a.pos, "type error " + b.pos + " " + a + " " + b)
    }
  }

  /**
   * 式に型を設定
   *
   * @param e: E 式
   * @param t: T 設定する型
   * @return E 型設定後の式
   */
  private def setT(e: E, t: T): E = {
    e match {
      case b: ECast => p(b, b.copy(t = t))
      case b @ EVar(_, a, c) => p(b, b.copy(t, a, c))
      case b: EBlock => p(b, b.copy(t = t))
      case b: ELd => p(b, b.copy(t = t))
      case b: ELdd => p(b, b.copy(t = t))
      case b: ELds => p(b, b.copy(t = t))
      case b: EId => p(b, b.copy(t = t))
      case b: EArray => p(b, b.copy(t = t))
      case b: EBin => p(b, b.copy(t = t))
      case b: ENeg => p(b, b.copy(t = t))
      case b: EAssign => p(b, b.copy(t = t))
      case b: ENewArray => p(b, b.copy(t = t))
      case b: ENew => p(b, b.copy(t = t))
      case b: EGCNew => p(b, b.copy(t = t))
      case b: ERef => p(b, b.copy(t = t))
      case b: EPtr => p(b, b.copy(t = t))
      case b: EField => p(b, b.copy(t = t))
      case b: EArrow => p(b, b.copy(t = t))
      case b: ECall => p(b, b.copy(t = t))
      case b @ ETypeDef(_, a) => p(b, b.copy(t, a))
      case b: ENop => p(b, b.copy(t = t))
      case b: EIf => p(b, b.copy(t = t))
      case b: EWhile => p(b, b.copy(t = t))
      case b: EDo => p(b, b.copy(t = t))
      case _ => throw new Exception("error")
    }
  }
}
