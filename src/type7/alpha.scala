package type7

object alpha {

  def apply(prog:Prog):Prog = {
    Prog(prog.b.map{case e:E =>f(e)})
  }

  def f(e: E): E = {
    genv = Map[String, String]()
    f(e, Map()) match { case (e, _) => e }
  }

  def find(id: String, env: Map[String, String]): String = {
    if (env.contains(id)) env(id) else id
  }
  
  def l(ls: List[E], env: Map[String, String]): (List[E], Map[String, String]) = {
    val (ls2, env2) = ls.foldLeft(List[E](), env) {
      case ((ls, env), a) =>
        val (a1, env1) = f(a, env)
        ((a1 :: ls), env1)
    }
    (ls2.reverse, env2)
  }
  def l2(ls: List[(E, E)], env: Map[String, String]): (List[(E, E)], Map[String, String]) = {
    val (cases1, env2) = ls.foldLeft(List[(E, E)](), env) {
      case ((ls, env), (a, b)) =>
        val (a1, env1) = f(a, env)
        val (b1, env2) = f(b, env1)
        (((a1, b1) :: ls), env)
    }
    (cases1.reverse, env2)
  }

  var genv = Map[String, String]()
  
  def add(env:Map[String, String], a:(String,String)):Map[String,String] = {
    genv = genv + a
    env + a
  }
  def p(e: E, e1: E) = transduce.p(e, e1)

  def f(e: E, env: Map[String, String]): (E, Map[String, String]) = {
    val rc = e match {
      case e @ EBin(t: T, t2: T, i: String, a: E, b: E) =>
        val (a1, env1) = f(a, env)
        val (b1, env2) = f(b, env1)
        (p(e, e.copy(t, t2, i, a1, b1)), env2)
      case e @ ELd(t: T, i: Long) => (p(e, e.copy(t, i)), env)
      case e @ EBlock(t: T, ls: List[E]) =>
        val (ls1, env1) = l(ls, env)
        (p(e, e.copy(t, ls1)), env)
      case e @ ECall(t: T, a: E, b) =>
        val (b1, env1) = l(b, env)
        val (a1, env2) = f(a, env1)
        (p(e, e.copy(t, a1, b1)), env2)
      case e @ EVar(t: T, id: String, a) =>
        val (a1, env1) = if (a == null) (null, env) else f(a, env)
        val id2 = if (genv.contains(id)) genid(".") else id
        (p(e, e.copy(t, id2, a1)), add(env1, (id,id2)))
      case e @ EVal(t: T, id: String, a) =>
        val (a1, env1) = if (a == null) (null, env) else f(a, env)
        val id2 = if (genv.contains(id)) genid(".") else id
        (p(e, e.copy(t, id2, a1)), add(env1,(id,id2)))
      case e @ EId(t: T, id: String) => (p(e, e.copy(t, find(id, env))), env)
      case e @ EField(t: T, t2: T, id: E, idx: String) =>
        val (id1, env1) = f(id, env)
        (p(e, e.copy(t, t2, id1, idx)), env)
      case e @ EAssign(t: T, a: E, b: E) =>
        val (a1, env1) = f(a, env)
        val (b1, env2) = f(b, env1)
        (p(e, e.copy(t, a1, b1)), env2)
      case e @ ESwitch(t: T, a: E, cases: List[(E, E)]) =>
        val (a1, env1) = f(a, env)
        val (cases1, _) = l2(cases, env1)
        (p(e, e.copy(t, a1, cases1)), env)
      case e: ENop => (e, env)
      /*
      case e @ ETag(t: T, id:String, ls: List[E]) =>
        val (ls1, env1) = l(ls, env)
        (p(e, e.copy(t, id, ls1)), env1)*/
      case e @ ETuple(t: T, ls: List[E]) =>
        val (ls1, env1) = l(ls, env)
        (p(e, e.copy(t, ls1)), env1)
      case e @ ETypeDef(t: T, id: String) => (p(e, e.copy(t, id)), env)
      //      case e : ECase => throw new Exception("error")

      case e @ EArray(_, _, _) => (e, env)
      case e @ EArrow(_, _, _, _) => (e, env)
      case e @ EBreak(_) => (e, env)
      case e @ ECase(_, _, _) => (e, env)
      case e @ ECast(_, _) => (e, env)
      case e @ EContinue(_) => (e, env)
      case e @ EDo(_, _, _) => (e, env)
      case e @ EFor(t, a, b, c, d) =>
        val (a1,env1) = f(a,env)
        val (b1,env2) = f(b,env1)
        val (c1,env3) = f(c,env2)
        val (d1,env4) = f(d,env3)
        (p(e,e.copy(t,a1,b1,c1,d1)), env)
      case e @ EFun(t, a, b, c) =>
        
        val (c1,env1) = f(c,env)
        (p(e,e.copy(t,a,b,c1)), env)
      case e @ EGCNew(_) => (e, env)
      case e @ EGoto(_, _) => (e, env)
      case e @ EIf(_, _, _, _) => (e, env)
      case e @ EImport(_) => (e, env)
      case e @ ELabel(_, _, _) => (e, env)
      case e @ ELdd(_, _) => (e, env)
      case e @ ELds(_, _) => (e, env)
      case e @ ENeg(_, _) => (e, env)
      case e @ ENew(_) => (e, env)
      case e @ ENewArray(_, _) => (e, env)
      case e @ ENot(_, _) => (e, env)
      case e @ EPtr(_, _) => (e, env)
      case e @ ERef(_, _) => (e, env)
      case e @ ERet(_, _) => (e, env)
      case e @ ESizeOf(_, _, _) => (e, env)
      case e @ EWhile(_, _, _) => (e, env)

    }
    print(e+"->"+rc)
    rc
  }
}
