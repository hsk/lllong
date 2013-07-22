package l0

import scala.collection.immutable.ListMap

object llcompile {

  def apply(b: E): List[LL] = {
    println("b="+b)
    f(b)
    ls.reverse
  }

  def apply(b: List[E]): List[LL] = {
        b.foreach(c)
        b.foreach(g)
        ls.reverse
  }
  def c(e: E) {
    e match {
      case EVar(id, t: TFun) =>
        global_env.add(id, t)
      case EFun(t, n, p, b) =>
        global_env.add(n, TFun(t, p.toList.map { case (id, t) => t }))
      case _ => throw new Exception("error")
    }
  }

  var ls = List[LL]() 
  def add(l:LL) {
    ls = l::ls
  }

  def g(e: E) {
    e match {
      case EVar(id, t: TFun) =>
      case EFun(t, n, p, b) =>
        env.init(p)
        val bkls = ls
        ls = List[LL]()
        
        for((id,t)<- p) {
          add(LLAlloca(RL(t, id)))
          add(LLStore(RL(t,id+".v"), RL(Tp(t),id)))
        }
        
        val r = f(b)
        val fun = LLFun(t, n, p, env.copy(), ls.reverse, r)
        ls = bkls
        add(fun)
      case _ => throw new Exception("error expression "+e)
    }
  }

  def gid(t:T):R = {
    RL(t,genid(".."))
  }
  
  def structIndex(t:T, id:String):Int = {
    t match {
      case TStr(ls) => ls.foldLeft(0){case (n,(id1,_))=> if(id1==id) return n; n+1}
      case _ => throw new Exception("Error")
    }
  }

  def r(t:T)(f:(R)=>R):R = f(gid(t))
  def r(r:R)(f:(R)=>R):R = f(r)
  def r2(t1:T,t2:T)(f:(R,R)=>R):R = f(gid(t1),gid(t2))
  
  def arr(a:E):R = {
    a match {
      case EId(id) => RL(Tp(env.map(id)),id)
      case EArray(id, idx) => r(Tp(Ti(64))) { r => add(LLField(r, RL(Tp(env.map(id)), id), RN(Ti(64), "0"), f(idx))); r }
      case EField(id, idx) => r(Tp(Ti(64))) { r =>
        val t = env.map(id)
        val idx1 = structIndex(t, idx)
        add(LLField(r, RL(Tp(t), id), RN(Ti(64), "0"), RN(Ti(32),""+idx1)))
        r
      }
      case _ => throw new Exception("error")
    }
  }
  
  def f(e: E):R = {
    e match {
      case EVar(id, t) =>
        t match {case t:TStr => llemit.structs = llemit.structs + (t -> RL(t, genid(".struct"))) case _ => }
        r(RL(t, id)){ r => add(LLAlloca(r)); env.add(id,t); r}
      case ELong(i) => r(Ti(64)){ r => add(LLBin(r, "add", RN(Ti(64),"0"), RN(Ti(64), ""+i))); r}
      case EAdd(a, b) => r(Ti(64)){ r => add(LLBin(r,"add", f(a), f(b))); r}
      case EMul(a, b) => r(Ti(64)){ r => add(LLBin(r,"mul", f(a), f(b))); r}
      case EBlock(l1) => l1.foldLeft(RN(Tv,null):R) {case (r,a)=> f(a) }
      case ECall(t, n, l1) => r(t){ r=> add(LLCall(r, RG(global_env.map(n),n) , l1.map { f })); r}
      case EAssign(a, b) => val b1 = f(b); add(LLStore(b1, arr(a))); b1
      case a:EField => r(Ti(64)) { r => add(LLLoad(r, arr(a))); r }
      case a:EArray => r(Ti(64)) {r => add(LLLoad(r, arr(a))); r }
      case EId(i) => r(Ti(64)) { r => add(LLLoad(r, RL(Tp(env.map(i)),i))); r }
/*      case EIf(a,b,c) =>
        val id0 = genid("ok")
        val id1 = genid("else")
        val id2 = genid("endif")
        f(a,("bne", id0, id1)::("label", id0)::f(b,("goto",id2)::("label",id1)::f(c,("goto",id2)::("label",id2)::("phi", id0, id2)::l)))*/
      case _ => throw new Exception("error")
    }
  }
}

sealed trait R {
  def t: T
  def id: String
}
case class RG(t:T, id: String) extends R
case class RL(t:T, id: String) extends R
case class RR(t:T, id: String) extends R
case class RN(t:T, id: String) extends R

sealed trait LL
case class LLCall(id: R, op: R, prms: List[R]) extends LL
case class LLBin(id: R, op: String, a: R, b: R) extends LL
case class LLAssign(a: R, b: R) extends LL
case class LLLoad(a: R, b: R) extends LL
case class LLStore(a: R, b: R) extends LL
case class LLAlloca(a: R) extends LL
case class LLField(id1: R, aid: R, z: R, b: R) extends LL
case class LLFun(t:T, n:String, p:ListMap[String,T], env:ListMap[String, T], ls:List[LL], r:R) extends LL

object llemit {

  var structs = Map[TStr,RL]()
  def p(t:T):String = {
    t match {
      case Ti(i) => "i" + i
      case Tv => "void"
      case TFun(t, ls) => p(t) + "(" + ls.map(p).mkString(", ") + ")*"
      case TArr(t, size) => "[" + size + " x " + p(t) + "]"
      case Tp(t) => p(t) + "*"
      case t:TStr => p(structs(t))
    }
  }

  def p(r:R): String = {
    r match {
      case RG(t,id) => "@" + id
      case RL(t,id) => "%" + id
      case RR(t,id) => "%." + id
      case RN(t,id) => "" + id
    }
  }

  def p(id: R, out: String) {
    if (id != null) asm(p(id) + " = " + out)
    else asm(out)
  }

  def f(l: LL) {
    l match {
      case LLCall(id, op, prms) =>
        val ps = prms.map { case a => p(a.t) + " " + p(a) }.mkString(", ")
        id.t match {
          case Tv => asm("call " + p(op.t) + " " + p(op) + "(" + ps + ") nounwind")
          case _ => p(id, "call " + p(op.t) + " " + p(op) + "(" + ps + ") nounwind")
        }
      case LLBin(id, op, a, b) =>
        p(id, op + " " + p(id.t) + " " + p(a) + ", " + p(b))
      case LLLoad(reg1: R, reg2: R) =>
        p(reg1, "load " + p(reg2.t) + " " + p(reg2))
      case LLStore(reg1: R, reg2: R) =>
        asm("store " + p(reg1.t) + " " + p(reg1) + ", " + p(reg2.t) + " " + p(reg2))
      case LLAlloca(reg: R) =>
        p(reg, "alloca " + p(reg.t))
      case LLField(reg1: R, addr: R, zero: R, a: R) =>
        addr.t match {
//          case Tp(Tp(adt)) =>
//            p(reg1, "getelementptr inbounds " + llt(addr.t) + " " + llr(addr) + ", " + llt(a.t) + " " + llr(a))
          case _ =>
            p(reg1, "getelementptr inbounds " + p(addr.t) + " " + p(addr) + ", " + p(zero.t) + " " + p(zero) + ", " + p(a.t) + " " + p(a))
        }
      case LLFun(t, n, ps, m, ls, r) =>
        asm.label("define " + p(t) + " @" + n + "(" + ps.map{case (a, t) => p(t) + " %" + a +".v" }.mkString(", ") + ") nounwind ssp {")
        asm.label("entry:")
        ls.foreach(f)
        (t,r) match {
          case (_,null) | (Tv,_) => asm("ret " + p(t))
          case _ => asm("ret " + p(t) + " " + p(r))
        }
        asm.label("}")
      case _:LLAssign => throw new Exception("error")
    }
  }

  def apply(file: String, ls:List[LL]) {
    asm.open(file)
    asm.indent = "\t"
    for ((TStr(ls), r) <- structs) {
      asm.label(p(r) + " = type { " + ls.map{case(_, t) => p(t)}.mkString(", ") + " }");
    }
    ls.foreach(f)

    asm.label("@.str = private constant [5 x i8] c\"%ld\\0A\\00\"")
    asm.label("define void @print_l(i64 %a) nounwind ssp {")
    asm.label("entry:")
    asm("%a_addr = alloca i64, align 8")
    asm("store i64 %a, i64* %a_addr")
    asm("%0 = load i64* %a_addr, align 8")
    asm("%1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i64 %0) nounwind")
    asm("ret void")
    asm.label("}")
    asm.label("declare i32 @printf(i8*, ...) nounwind")
    asm.close()
    
  }
}

object lltest {
  def main(argv: Array[String]) {
    val ast = List(
      EVar("print_l", TFun(Tv, List(Ti(64)))),
      EFun(Tv, "main", ListMap(), EBlock(List(
        ECall(Tv, "print_l", List(ELong(1))),
        ECall(Tv, "print_l", List(ECall(Ti(64), "add", List(ELong(2), ELong(3))))),
        ECall(Tv, "print_l", List(EMul(EAdd(ELong(2), ELong(3)), ELong(2)))),
        EVar("a", TArr(Ti(64),10)),
        EAssign(EArray("a", ELong(1)), ELong(3)),
        EAssign(EArray("a", ELong(2)), EAdd(ELong(3),ELong(5))),
        EPrint(EArray("a", ELong(1))),
        EPrint(EArray("a", ELong(2))),

        EPrint(EAdd(EArray("a", ELong(1)),EArray("a",ELong(2)))),

        EVar("b", TStr(ListMap("x" -> Ti(64), "y" -> Ti(64)))),
        EAssign(EField("b", "x"), ELong(3)),
        EAssign(EField("b", "y"), EMul(ELong(3), ELong(5))),
        EPrint(EField("b", "x")),
        EPrint(EField("b", "y")),
        EPrint(EAdd(EField("b", "x"), EField("b", "y"))),
        EVar("c", Ti(64)),
        EAssign(EId("c"), ELong(5)),
        EPrint(EId("c"))
//        ECall(Tv, "print_l",List(EIf(ELong(1),ELong(14),ELong(214))))

      ))),
      EFun(Ti(64), "add", ListMap("a" -> Ti(64), "b" -> Ti(64)),
        EAdd(EId("a"), EId("b")))
    )
    val codes = llcompile(ast)
    println("# l=" + codes)
    llemit("e.s", codes)
    println(exec("llc e.s"))
    println(exec("llvm-gcc -m64 e.s.s -o e"))
    println(exec("./e"))
  }
}
