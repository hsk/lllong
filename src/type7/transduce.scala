package type7
import scala.collection.immutable.ListMap

/**
 * トランデューサ
 */
object transduce {

  def apply(st: Any): Prog = {
    Prog(fs(st))
  }

  /**
   * 位置情報を構文木に付け加える
   * 
   * @param t: Token
   * @param e: E
   * @return E
   */ 
  def p(t: Token, e: E): E = {
    e.pos = t.pos
    e
  }

  /**
   * 位置情報を構文木に付け加える
   * 
   * @param t: E
   * @param e: E
   * @return E
   */
  def p(t: E, e: E): E = {
    e.pos = t.pos
    e
  }

  /**
   * 位置情報をタイプに付け加える
   * 
   * @param o: Token
   * @param t: T
   * @return T
   */
  def q(o: Token, t: T): T = {
    t.pos = o.pos
    t
  }

  /**
   * ２項の構文木を作成し、１つ目の項の位置にする
   */
  def bin(f1: (T, E, E) => E, a: Any, b: Any): E = {
    val a1 = f(a)
    val a2 = f(b)
    val e = f1(Tn, a1, a2)
    e.pos = a1.pos
    e
  }

  /**
   * 2項演算子
   * 
   * @param f1: String 演算子名
   * @param a: Any 左の構文木
   * @param b: Any 右の構文木
   * @return E 式
   */
  def bin(op: String, a: Any, b: Any): E = {
    val (a1, a2) = (f(a), f(b))
    val e = EBin(Tn, Tn, op, a1, a2)
    e.pos = a1.pos
    e
  }

  /**
   * メインの変換関数
   * 
   * @param st: Any 変換元のcompactデータ
   * @return E 式
   */
  def f(st: Any): E = {
    // println("f "+st)
    st match {
      case (o @ Id("import"), f) =>
        p(o, EImport(fimport(f)))
      case ((o @ Id("def"), ((Id(name), Id("("), r, Id(")")), Id(":"), typ)), Id("="), b) =>
        p(o, EFun(t(typ), "" + name, fprms(r), f(b)))
      case (o @ Id("def"), ((Id(name), Id("("), r, Id(")")), o2 @ Id("{"), e, Id("}"))) =>
        p(o, EFun(Tv, "" + name, fprms(r), p(o2, EBlock(Tn, fs(e)))))
      case (o @ Id("def"), ((Id(name), Id("("), b, Id(")")), Id(":"), typ)) =>
        global_env.add(name, TFun(t(typ), fprms(b).toList.map { case (id, t) => t }))
        ENop(Tv, "def function")
      case (o @ Id("{"), e, Id("}")) => p(o, EBlock(Tn, fs(e)))
      case o @ Lng(a) => p(o, ELd(Tn, a))
      case o @ Dbl(a) => p(o, ELdd(Tn, a))
      case o @ Str(a) => p(o, ELds(Tn, a))
      case (o @ Id("-"), Lng(a)) => p(o, ELd(Ti(64), -a))
      //      case (o@Id("-"), Dbl(a)) => p(o,ELdd(Td, -a)) 
      case ((o @ Id("var"), (Id(a), Id(":"), t1)), Id("="), b) => p(o, EVar(t(t1), a, f(b)))
      case ((o @ Id("var"), Id(a)), Id("="), b) => p(o, EVar(Tn, a, f(b)))
      case ((o @ Id("val"), (Id(a), Id(":"), t1)), Id("="), b) => p(o, EVal(t(t1), a, f(b)))
      case ((o @ Id("val"), Id(a)), Id("="), b) => p(o, EVal(Tn, a, f(b)))
      case (a, Id("="), b) => bin(EAssign, a, b)
      case (a, Id("["), b, Id("]")) => bin(EArray, a, b)
      case (o @ Id("*"), a) => p(o, EPtr(Tn, f(a)))
      case (o @ Id("&"), a) => p(o, ERef(Tn, f(a)))
      case (o @ Id("new"), (a, Id("["), b, Id("]"))) => p(o, ENewArray(Tp(t(a)), f(b)))
      case (o @ Id("sizeof"), a) =>
        try {
          val t1 = t(a); p(o, ESizeOf(Ti(64), t1, null))
        } catch {
          case _: Throwable => p(o, ESizeOf(Ti(64), Tn, f(a)))
        }
      case o @ Id("return") => p(o, ERet(Tn, ENop(Tv, "void")))
      case (o @ Id("return"), Id(";")) => p(o, ERet(Tv, ENop(Tv, "void")))
      case (o @ Id("return"), a) => p(o, ERet(Tn, f(a)))
      case (o @ Id("new"), a) => p(o, ENew(Tp(t(a))))
      case (o @ Id("gcnew"), a) => p(o, EGCNew(Tp(t(a))))
      case (o @ Id("cast"), Id("("), t1, Id(")"), a) => p(o, ECast(t(t1), f(a)))
      case (a, Id("+"), b) => bin("add", a, b)
      case (a, Id("-"), b) => bin("sub", a, b)
      case (a, Id("*"), b) => bin("mul", a, b)
      case (a, Id("/"), b) => bin("div", a, b)
      case (a, Id("%"), b) => bin("mod", a, b)
      case (o @ Id("-"), a) => p(o, ENeg(Tn, f(a)))
      case (a, Id("<<"), b) => bin("shl", a, b)
      case (a, Id(">>>"), b) => bin("shr", a, b)
      case (a, Id(">>"), b) => bin("ushr", a, b)
      case (a, Id("&"), b) => bin("and", a, b)
      case (a, Id("|"), b) => bin("or", a, b)
      case (a, Id("^"), b) => bin("xor", a, b)
      case (a, Id("&&"), b) => bin("and", a, b)
      case (a, Id("||"), b) => bin("or", a, b)
      case (o @ Id("!"), a) => p(o, ENot(Tn, f(a)))
      case (a, Id("<="), b) => bin("le", a, b)
      case (a, Id("<"), b) => bin("lt", a, b)
      case (a, Id(">="), b) => bin("ge", a, b)
      case (a, Id(">"), b) => bin("gt", a, b)
      case (a, Id("=="), b) => bin("eq", a, b)
      case (a, Id("!="), b) => bin("ne", a, b)
      case (a, Id("+="), b) => f(a, Id("="), (a, Id("+"), b))
      case (a, Id("-="), b) => f(a, Id("="), (a, Id("-"), b))
      case (a, Id("++")) => f(a, Id("="), (a, Id("+"), Lng(1)))
      case (a, Id("--")) => f(a, Id("="), (a, Id("-"), Lng(1)))
      case (a, Id(";")) => f(a)
      case (o @ Id("var"), (Id(a), Id(":"), b)) => p(o, EVar(t(b), a, null))
      case (o @ Id("typedef"), (Id(a), Id("="), b)) => p(o, ETypeDef(t(b), a))
      case o @ Id("void") => p(o, ENop(Tv, "void"))
      case o @ Id("break") => p(o, EBreak(Tn))
      case o @ Id("continue") => p(o, EContinue(Tn))
      case o @ Id(a) => p(o, EId(Tn, a))
      case (a, Id("("), b, Id(")")) =>
        val o = f(a); p(o, ECall(Tn, o, prms(b)))
      case (a, Id("."), Id(b)) =>
        val o = f(a); p(o, EField(Tn, Tn, o, b))
      case (a, Id("->"), Id(b)) =>
        val o = f(a); p(o, EArrow(Tn, Tn, o, b))
      case (o @ Id("if"), Id("("), a, Id(")"), (b, Id("else"), c)) =>
        p(o, EIf(Tn, f(a), f(b), f(c)))
      case (o @ Id("if"), Id("("), a, Id(")"), b) =>
        p(o, EIf(Tn, f(a), f(b), ENop(Tv, "void")))
      case (o @ Id("while"), Id("("), a, Id(")"), b) => p(o, EWhile(Tn, f(a), f(b)))
      case (o @ Id("for"), Id("("), (Id(";"), Id(";")), Id(")"), b) => p(o, EFor(Tn, ENop(Tn, ""), ENop(Tn, ""), ENop(Tn, ""), f(b)))
      case (o @ Id("for"), Id("("), (a, Id("@"), (b, Id(";")), Id(")")), body) =>
        p(o, EFor(Tn, f(a), f(b), ENop(Tn, ""), f(body)))
      case (o @ Id("for"), Id("("), (a, Id("@"), (b, Id("@"), c)), Id(")"), body) =>
        p(o, EFor(Tn, f(a), f(b), f(c), f(body)))
      case (a, o @ Id("is"), (Id("{"), b, Id("}"))) => p(o, ESwitch(Tn, f(a), switches(b)))
      case (Id("_"), o @ Id("?")) => p(o, ECase(Tn, null, ENop(Tv, "")))
      case (a, o @ Id("?")) => p(o, ECase(Tn, f(a), ENop(Tv, "")))
      case ((o @ Id("switch"), Id("("), a, Id(")")), Id("{"), b, Id("}")) =>
        p(o, ESwitch(Tn, f(a), switches(b)))
      case (o @ Id("do"), Id("{"), a, Id("}"), (Id("while"), Id("("), b, Id(")"), Id(";"))) =>
        p(o, EDo(Tn, fs(a), f(b)))
      case (o @ Id("goto"), Id(a)) => p(o, EGoto(Tn, a))
      case (o @ Id("("), a @ (_, Id(","), _), Id(")")) => ETuple(Tn, tpl(a))
      case (o @ Id("("), a, Id(")")) => p(o, f(a))
      case (o @ Id("default"), Id(":"), b) => p(o, ECase(Tn, null, f(b)))
      case (o @ Id(a), Id(":"), b) => p(o, ELabel(Tn, a, f(b)))

      case (o @ Id("case"), (a, Id(":"), b)) => p(o, ECase(Tn, f(a), f(b)))
      case (o @ Id("case"), Id("_"), Id(":")) => p(o, ECase(Tn, null, ENop(Tv, "")))
      case (o @ Id("case"), a, Id(":")) => p(o, ECase(Tn, f(a), ENop(Tv, "")))

      case o @ () => throw TypeError(null, "error syntax error " + o)
      case o => val t = findToken(o); throw TypeError(t.pos, "error syntax error " + t + " " + o)
    }
  }

  /**
   * 多値(タプル)の変換
   */
  def tpl(a: Any): List[E] = {
    a match {
      case (a, Id(","), b) => tpl(a) ::: tpl(b)
      case o => List(f(o))
    }
  }

  /**
   * 多値内の１個目のトークンを取得
   * 
   * @param a: Any
   * @return Token
   */
  def findToken(a: Any): Token = {
    a match {
      case a: Token => a
      case (a, b) => findToken(a)
      case (a, b, c) => findToken(a)
      case (a, b, c, d) => findToken(a)
      case (a, b, c, d, e) => findToken(a)
    }
  }

  /**
   * スイッチ内のケースの操作
   */
  def switches(e: Any): List[(E, E)] = {
    def f(l: List[E], r: List[(E, E)], casee: E, casel: List[E]): List[(E, E)] = {
      l match {
        case List() =>
          val r2 = if (casee == null) r else (casee, EBlock(Tn, casel.reverse)) :: r
          r2.reverse
        case (e @ ECase(t, a, b)) :: l =>
          val r2 = if (casee == null) r else (casee, EBlock(Tn, casel.reverse)) :: r
          f(l, r2, e, List(b))
        case e :: l => f(l, r, casee, e :: casel)
      }
    }
    f(fs(e), List(), null, List())
  }

  /**
   * 関数のパラメータの変換
   */
  def fprms(st: Any): Map[String, T] = {
    def ff(st: Any, m: Map[String, T]): Map[String, T] = {
      st match {
        case (a, Id(","), b) => ff(b, ff(a, m))
        case (Id(a), Id(":"), typ) => m + (a -> t(typ))
        case Id("void") => m
      }
    }
    ff(st, ListMap())
  }

  /**
   * 関数パラメータ等の変換
   */
  def prms(st: Any): List[E] = {
    st match {
      case (a, Id(","), b) => f(a) :: prms(b)
      case a => List(f(a))
    }
  }

  /**
   * 複数の式の変換
   */
  def fs(st: Any): List[E] = {
    st match {
      case (a, Id("@"), b) => fs(a) ::: fs(b)
      case a => List(f(a))
    }
  }

  /**
   * 複数の式の変換
   */
  def fimport(st: Any): String = {
    st match {
      case (Id(a), Id("."), b) => a + "/" + fimport(b)
      case Id(a) => a
    }
  }
  
  /**
   * 型の変換
   */
  def t(st: Any): T = {
    st match {
      case (Id("Ptr"), Id("["), a, Id("]")) => Tp(t(a))
      case (Id("Array"), Id("["), (a, Id(","), Lng(b)), Id("]")) => TArr(t(a), b)
      case (a, Id("=>"), b) => TFun(t(b), ts(a))
      case (a, Id("["), Lng(b), Id("]")) => TArr(t(a), b)
      case Id("byte") => Ti(8)
      case Id("short") => Ti(16)
      case Id("int") => Ti(32)
      case Id("long") => Ti(64)
      case Id("float") => Tf
      case Id("double") => Td
      case Id("void") => Tv
      case (o @ Id("*"), a) => Tp(t(a))
      case (o @ Id("struct"), Id("{"), b, Id("}")) => TStr(members(b, ListMap[String, T]()))
      case (Id("("), a, Id(")")) => t(a)
      case Id(s) => TDef(s)
      case o => val t = findToken(o); throw TypeError(t.pos, "error syntax error " + t + " " + o)
    }
  }

  /**
   * 型リストの変換
   */
  def ts(st: Any): List[T] = {
    //println("members "+st)
    st match {
      case (Id("("), a, Id(")")) => ts(a)
      case (a, Id(","), b) => t(a) :: ts(b)
      case a => t(a) match { case Tv => List() case t => List(t) }
    }
  }

  /**
   * 構造体のメンバの変換
   */
  def members(st: Any, m: ListMap[String, T]): ListMap[String, T] = {
    //println("members "+st)
    st match {
      case Id("void") => m
      case (Id(a), Id(":"), b) => m + (a -> t(b))
      case (a, Id(";")) => members(a, m)
      case (a, Id("@"), b) => members(b, members(a, m))
      case o => val t = findToken(o); throw TypeError(t.pos, "error syntax error " + t + " " + o)
    }
  }

}
