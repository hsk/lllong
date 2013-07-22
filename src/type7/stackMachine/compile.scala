package type7.stackMachine

import type7._
import scala.collection.mutable.ArrayBuffer

object compile {
  var buf:ArrayBuffer[Any] = null
  def add(a:Any) {
    buf += a
  }
  def apply(e:Prog):ArrayBuffer[Any] = {
    buf = new ArrayBuffer[Any]
    //println(e)
    e.b.foreach{e=>g(e)}
    buf
  }
  
  def g(e:E) {
    e match {
      case EVar(t,id, e) =>
        add("global", t, id, e)
      case EFun(t,n,p,b) =>
        retT = t
        retLabel = genid("leave")
        env.init(p)
        breaks = List()
        continues = List()
        val patchPos = buf.size
        if(t != Tv) {
          env.add(".retVal", t)
        }
        add(null)
        f("enter",b)
        if(t == Tv && t != b.t) {
          add("pop")
        }
        add("label", retLabel)
        add("leave", e)
        buf.update(patchPos, ("enter", e, env.copy()))
      case ETypeDef(t, id) =>
        
        
      case _:ENop =>
      case _ => throw TypeError(e.pos, "error global value "+e)
    }
  }
  var retLabel:String = null
  var retT:T = null
  var breaks = List[String]()
  var continues = List[String]()
  type Label = String
  def pop(l:Label, e:E):Label = {
    e.t match {
      case Tv => f(l, e)
      case _ => val l2 = f(l, e); add("pop"); l2
    }
  }
  
  def f(l:Label, e: E):Label = {
    add(("nop","# "+e))
    e match {
      case EVar(t:TFun, id, c) => env.add(id,t); if(c!=null) assign(l, t, EId(t,id), c) else l
      case EVar(t, id, c) => env.add(id, t); if(c!=null) assign(l, t, EId(t,id), c) else l
      case ETypeDef(t, id) => env.addTypeDef(id, t); l
      case ENewArray(t, a) => val l2 = f(l, a);add("newarray", t); l2
      case ESizeOf(_, t, _) => add("ldc", Ti(64), env.size(t)); l
      case ERet(t, a) =>
        val l1 = f(l, a);val l2 = genid("ret"); 
        if(t != Tv && t != Tr(Tv)) {
          add("store", t, ".retVal")
          add("goto", l2, "leave")
        } else {
          add("goto", l2, retLabel)
        }
        l2
      case ENew(Tp(t)) => add("new", t); l
      case EGCNew(Tp(t)) => add("gcnew", t); l
      case EBlock(t, l1) =>
        def f1(l:String, es:List[E]):String = {
          es match {
          case (List(e)) => f(l, e) // 最後はpopしない
          case (e::es) => f1(pop(l, e), es)
          }
        }
        f1(l, l1)
      case ELd(t, i) => add("ldc", t, i); l
      case ELdd(t, i) => add("ldcd", t, i); l
      case ELds(_, i) => add("ldcs", i); l
      case EBin(t, it, f1, a, b) => val l2 = f(f(l, a), b);add(Cst(f1, it)); l2
      case ENeg(t, a) => val l2 = f(l, a);add(Cst("neg", t)); l2
      case ENot(t, a) => val l2 = f(l, a);add(Cst("not", t)); l2
      case ERef(t, EId(_, id)) => add("load", t, id); l
      case _: EArray | _: EField | _: EPtr | _: EArrow | _:EId => field(l, e)
      case EAssign(t, a, b) => assign(l, t, a, b)
      case ECall(t, EId(ft, a), l1) if(global_env.map.contains(a)) =>
        add("nop", e)
        val l2 = l1.reverse.foldLeft(l) {(l, e) => add("nop", e);f(l, e) }
        add("call", a, ft)
        l2
      case ECall(t, fe, l1) =>
        add("nop", e)
        val l2 = l1.reverse.foldLeft(l) {(l, e) => add("nop", e);f(l, e) }
        val l3 = f(l2, fe)
        add("call", fe.t)
        l3
      case ENop(t, a) => add("nop", a); l
      case ELabel(t, a, b) => add("label", "Local._"+ a);f(l, b)
      case ECast(t, a) => val l2 = f(l, a); add("cast", a.t, t); l2
      case EGoto(t, a) => val l = genid("goto"); add("goto", l, "Local._"+ a); l
      case EBreak(_) => val (b::bs) = breaks; val l = genid("break"); add("goto", l, b); l
      case EIf(t, a, b, c) =>
        val id0 = genid("ok")
        val id1 = genid("else")
        val id2 = genid("endif")
        f(l, a)// cond
        add("jne", id0, id1)
        val l0 = f(id0, b)// then
        if(t==Tv && b.t!=Tv) add("pop")
        add("goto", id1, id2)
        val l1 = f(id1, c)// else
        if(t==Tv && c.t!=Tv) add("pop")
        add("goto", id2, id2)
        if(t != Tv && c.t == b.t) add("phi", l0, l1, t)
        id2
      case EWhile(t, a, b) =>
        val id0 = genid("id0")
        val id1 = genid("while")
        val id2 = genid("endwhile")
        continues = id1::continues
        breaks = id2::breaks
        add("label",id1)
        f(id1, a)
        add("jne", id0, id2)
        f(id0, b)
        add("goto",id2, id1)
        continues = continues.tail
        breaks = breaks.tail
        id2
      case EFor(t, a, b, c, d) =>
        val id0 = genid("ok")
        val id1 = genid("for")
        val id2 = genid("endfor")
        continues = id1::continues
        breaks = id2::breaks
        pop(l, a)
        add("label",id1)
        f(id1, b)
        add("jne", id0, id2)
        val l2 = f(id0, d)
        pop(l2, c)
        add("goto",id2, id1)
        continues = continues.tail
        breaks = breaks.tail
        id2
      case EDo(t, l1, a) =>
        val id0 = genid("ok")
        val id1 = genid("do")
        val id2 = genid("enddo")
        continues = id1::continues
        breaks = id2::breaks
        add("label",id1)
        val l2 = l1.foldLeft(id1){ case (l,e) => pop(l, e) }
        f(l2, a)
        add("jeq",id0,id1)
        add("label",id2)
        continues = continues.tail
        breaks = breaks.tail
        id2
        
      case ESwitch(t, a, cs:List[(E,E)]) =>
        val lbl = genid("switch")+"_"
        val end = lbl+"end"
        breaks = end::breaks
        val switchval=genid("...")
        env.add(switchval, a.t)
        // 値を評価
        val l2 = f(l, a)
        add("store",a.t,switchval)
        // とび先を順番にチェックする
        val (next, hasDefault, defaultno) = cs.foldLeft(l2, false,0) {
          case ((l,hasDefault,no), (ECase(t, null, _), b)) => (l,true, no)// default
          case ((l,hasDefault,no), (ECase(t, a, _), b)) =>// case a: b
            f(l, a)
            add("load",a.t, switchval)
            add(Cst("eq",a.t))
            val next = lbl+"case"+(no+1)
            add("jeq", next, lbl+no)// 同じときはジャンプ
            (next, hasDefault, no + 1)
        }
        if(!hasDefault) {
          add("goto", lbl+"_block", end)
        } else {
          add("goto", lbl+"_block", lbl+"_default")
        }
        // とび先
        cs.foldLeft(0) {
          case (no, (ECase(t, null, _), b)) =>// default
            add("label", lbl+"_default")
            f(lbl+"_default", b)
            no
          case (no, (ECase(t, a, _), b)) =>
            add("label", lbl+no)
            f(lbl+no, b)
            no+1
        }
        breaks = breaks.tail
        // 終了
        add("label",end)
        end
      case _ => throw new Exception("error "+e)
    }
  }

  def field(l:Label, e: E):Label = {
    e match {
      case EId(_, id) => add("load",env.find(id), id); l
      case EField(_, t, e, idx) => val l2 = field(l, e);add("getfield", idx, t); l2
      case EArray(t, e, idx) => val l2 = f(field(l, e),idx); add("aload",t); l2
      case EPtr(t, e) => val l2 = field(l, EArray(t, e, ELd(Ti(64), 0))); l2
      case EArrow(t, t2, e, idx) => field(l, EField(Tn, t2, EPtr(t2,e), idx))
      case _ => l
    }
  }

  def assign(l:Label, t: T, a: E, b: E):Label = {
    a match {
      case EId(_, a) => val l2 = f(l,b); add("store",env.find(a), a); l2
      case EArray(t, e, idx) => val l2 = f(f(field(l, e), idx),b);add("astore", t); l2
      case EField(_, t, e, idx) => val l2= f(field(l, e),b);add("putfield", idx, t); l2
      case EPtr(t, e) => val l2 = f(f(field(l,e),ELd(Ti(64), 0)),b);add("astore",t); l2
      case EArrow(t1, t2, e, idx) => f(l, EAssign(t, EField(t1, t2, EPtr(t2, e), idx), b))
      case _ => l
    }
  }
}
