package type7.stackMachine
import type7._
import scala.collection.mutable.ArrayBuffer


case class Cst(s:String,t:T)
case class Csts(s:String, t:T, a:String)

object ll_emit {
  var consts = List[Any]()
  var ts = Map[T,String]()
  var stack = List[(T,String)]()
  def pushq(a:(T,String)) {
    stack = a :: stack
  }
  def popq(): (T,String) = {
    stack match {
      case List() => asm.close(); throw new Exception("stack is empty")
      case x :: xs => stack = xs; x
    }
  }
  def pops():String = popq()._2
  def peekq(): (T,String) = {
    stack match {
      case List() => throw new Exception("stack is empty")
      case x :: xs => x
    }
  }
  def peeks():String = peekq()._2
  def lbin(f: (String, String, String) => T) {
    val c = pops()
    val a = pops()
    val l = genid("%...")
    val t = f(l, a, c)
    pushq(t,l)
  }
  def l1(f: (String, String) => T) {
    val a = pops()
    val l = genid("%...")
    val t = f(l, a)
    pushq(t, l)
  }
  def push(f: (String) => T) {
    val reg = genid("%...")
    pushq(f(reg), reg)
  }
  
  def llt(t: T): String = t match {
    case Tv => "void"
    case TArr(t,n) => "[" + n + " x " + llt(t)+"]"
    case Ti(i) => "i"+i
    case Tu(i) => "i"+i
    case Tf => "float"
    case Td => "double"
    case Tp(Tv) => "i8*"
    case Tp(t) => llt(t) + "*"
    case TStr(m) =>
      if(!ts.contains(t)) ts = ts + (t->genid("%struct..anon"))
      ts(t)
    case TDef(_) => llt(env.stripType(t))
      
    case TFun(t,ts) =>
      val v = ts.foldLeft("") {
        case ("", t) => llt(t)
        case (v, t) => v + ", " + llt(t)
      }
      llt(t) + " ("+v+")*"
  }
  def llt2(t:T):String = {
    def f(t:T):T = t match {
      case TArr(t,s) => Tp(f(t))
      case TDef(s) => f(env.find(s))
      case t => t
    }
    llt(f(t))
  }
  var completeds = Set[String]()
  def apply(file: String, l: ArrayBuffer[Any]) {
    completeds = Set[String]()
    asm.open(file)
    asm.obStart()
    ts =Map[T,String]()
    l.foreach {e=> g(e) }
    val o = asm.obEnd()
    ts.foreach {
      case(t,name) =>
        t match {
          case TStr(m) => asm.p(name + " = type {" + m.map { case (n, t) => llt(t) }.mkString(", ") + "}")
          case _ => throw new Exception("error")
        }
    }    
    
    global_env.map.foreach {
      case (id,TFun(t,p)) if(!completeds.contains(id))=>
        val prms = p.foldLeft("") {
          case ("", t1) => llt2(t1)
          case (l, t1) => l + ", " + llt2(t1)
        }
        asm.apply("declare "+llt(t)+" @"+id+"("+prms+") nounwind")
      case _ =>
    }
    asm.p(o)
    asm.close()
  }

  def g(e: Any) {
    if(main2.debug) println(e)

    asm.p("; "+e)
    if (f(e)) return
    throw new Exception("unknown instruction " + e)
  }

  def f(e: Any): Boolean = {
    e match {
      case "nop" =>
      case ("nop", a) =>
      case ("call", id: String, t) =>
        global_env.map(id) match {
          case TFun(t, p) =>
            val prms = p.foldLeft("") {
              case ("", t1) => llt2(t1) + " " + pops()
              case (l, t1) => l + ", " + llt2(t1) + " " + pops()
            }
            t match {
              case Tv => asm.p("call " + llt(t) + " @" + id + "(" + prms + ") nounwind ssp")
              case _ => push { l => asm.p(l + " = call " + llt(t) + " @" + id + "(" + prms + ") nounwind ssp"); t }
            }
          case t =>
            println("kotti? t="+t)
        }
      case ("call", t1:T) =>
        t1 match {
          case TFun(t, p) =>
            val id = pops()
            val reg = genid("%...call")
            asm.p(reg + " = load "+llt(Tp(t1))+" "+id)
            val prms = p.foldLeft("") {
              case ("", t1) => llt2(t1) + " " + pops()
              case (l, t1) => l + ", " + llt2(t1) + " " + pops()
            }
            t match {
              case Tv => asm.p("call " + llt(t) + " " + reg + "(" + prms + ") nounwind ssp")
              case _ => push { l => asm.p(l + " = call " + llt(t) + " " + reg + "(" + prms + ") nounwind ssp"); t }
            }
          case _ =>
            throw new Exception("TODO: implementation call "+t1)
        }

      case ("enter", EFun(t, name, p, _), e: env.envdata) =>
        env.load(e)
        ll_emit.consts = List()
        val prms = p.foldLeft("") {
          case ("", (id, t)) => llt(t) + " %.." + id
          case (l, (id, t)) => l + ", " + llt(t) + " %.." + id
        }
        val lt = llt(t)
        if (name == "main" && lt == "void") {
          asm.apply("define i32 @" + name + "(" + prms + ") nounwind ssp {")
        } else {
          asm.apply("define " + llt(t) + " @" + name + "(" + prms + ") nounwind ssp {")
        }
        asm.apply("entry:")
        e._1.foreach { case (a, t) => asm.p("%." + a + " = alloca " + llt(t)) }
        p.foreach {
          case (id, t) =>
            asm.p("store " + llt(t) + " %.." + id + ", " + llt(Tp(t)) + " %." + id)
        }
        completeds = completeds + name
      case ("leave", EFun(t, name, p, _)) =>
        t match {
          case Tv => if (name == "main") asm.p("ret i32 0") else asm.p("ret void")
          case t: TFun => println("error " + t)
          case _ =>
            asm.p("store " + llt(t) + " " + pops()+ ", "+llt(t)+"* %..retVal")
            asm.p("br label %leave")
            asm.apply("leave:")
            val reg = genid("%...")
            asm.p(reg + " = load "+llt(Tp(t))+" %..retVal")
            asm.p("ret " + llt(t) + " "+reg)
        }
        asm.apply("}")

        if (ll_emit.consts != List()) {
          ll_emit.consts.foreach {
            case (id, asc: String, t) =>
              asm.apply("@." + id + "= private constant " + t + " c" + asc.subSequence(0, asc.length-1)+"\\00\"")
            case (id, a, t) =>
              asm.apply("@." + id + "= private constant " + t + " " + a)
          }
        }
      // const ロード
      case ("ldc", t: T, n: Long) => pushq(t, "" + n)
      case ("ldcd", t: T, a: Double) => t match {
        case Tf => pushq(t, "0x" + java.lang.Long.toHexString(java.lang.Double.doubleToLongBits(a.asInstanceOf[Float].asInstanceOf[Double])))
        case Td => pushq(t, "0x" + java.lang.Long.toHexString(java.lang.Double.doubleToLongBits(a)))
        case _ => throw new Exception("error")
      }
      case ("ldcs", a: String) =>
        val id = genid("str")
        val t = TArr(Ti(8), a.length - 2 + 1)
        ll_emit.consts = (id, a, llt(t)) :: ll_emit.consts
        push { r =>
          val reg = genid("%...")
          asm.p(r + " = bitcast "+ llt(Tp(t)) + " @." + id + " to i8*")
          t
        }
      case ("global", t: T, id: String, e @ (_: E | null)) =>
        val e2: E = e match {
          case null =>
            t match {
              case Ti(_) => ELd(t, 0)
              case Tf | Td => ELdd(t, 0.0)
              case null => null
              case _ => e.asInstanceOf[E]
            }
          case e => e.asInstanceOf[E]
        }
        def o2(e: E):String = e match {
          case ELd(_,v) => ""+v
          case ELdd(_,v) => ""+v
          case ETuple(_,ls) => 
              "{"+ls.foldLeft("") {
                case ("", l) => llt(l.t) + " " + o2(l)
                case (v, l) => v + ", " + llt(l.t) + " " + o2(l)
              }+"}"
          case _ => throw new Exception("error")
        }
        def out(t: T, e2: E) {
          (t, e2) match {
            case (t, ELd(_, v)) => asm.p("@"+id+" = global "+llt(t)+" " + v)
            case (t, ELdd(_, v)) => asm.p("@"+id+" = global "+llt(t)+" " + v)
            case (t: TStr, v@ETuple(_, _)) => asm.p("@"+id+" = global "+llt(t)+" " + o2(v) )
            case (t, null) =>  asm.p("@"+id+" = common global "+llt(t)+" zeroinitializer")
            //case (_, EId(_, v)) => asm("@"+id+" = @"+v)
            case _ => throw new Exception("error")
          }
        }
        out(t, e2)
      case ("load", t:T, a: String) =>
        tName2(t) match {
          case "a" | "p" =>
            val t = env.stripType(env.find(a))
            t match {
              case t: Tp => push { r => asm.p(r + " = load " + llt(t) + "* " + vName(a)); t }
              case t: Tr => pushq(t, vName(a))
              case TArr(t2,_)=>
                push{r => asm.p(r + " = bitcast " + llt(Tp(t)) + " "+vName(a)+" to "+llt(Tp(t2))); Tp(t2)}
              case t => pushq(Tp(t),vName(a))
            }
          case _ =>
            push { r =>
              asm.p(r + " = load "+llt(Tp(t))+" " + vName(a)); t
            }
        }
        
      case ("store", t:T, a:String) =>
        tName2(t) match {
          case "a" =>
            val reg = peekq()
            val t = env.find(a)
            val reg2 = genid("%...")
            asm.p(reg2 + " = bitcast " + llt(reg._1) + " " + reg._2 + " to " + llt(t))
            asm.p("store " + llt(t) + " " + reg2 + ", " + llt(Tp(t)) + " " + vName(a))
          case "p" =>
            val (Tp(t),v) = popq()
            asm.p("store "+llt(t)+" "+v+", "+llt(Tp(t))+" %."+a)
            pushq((t,v))
          case _ =>
            asm.p("store "+llt(t)+" "+peeks() +", "+llt(t)+"* " + vName(a))
        }
      case ("aload", t:T) =>
        tName2(t) match {
          case "a" => // 配列ロード
            push { r =>
              val pop2 = popq()
              val pop1 = popq()
              val r1 = genid("%...")
              asm.p(r1 + " = getelementptr inbounds " + llt(pop1._1) + " " + pop1._2 + ", " + llt(pop2._1) + " " + pop2._2)
              asm.p(r + " = load " + llt(pop1._1) + " " + pop1._2)
              pop1._1
            }
          case "p" => // 配列ロード
            push { l =>
              val b = pops()
              val (t, a) = popq()
              val t2 = t match {
                case Tp(TArr(t, size)) => Tp(t)
                case _ => t
              }
              val r = genid("%...")
              asm.p(r + " = bitcast " + llt(t) + " " + a + " to " + llt(t2))
              asm.p(l + " = getelementptr inbounds " + llt(t2) + " " + r + ", i64 " + b)
              t2
            }
          case _ =>
            val typ = llt(Tp(t))
            val pop2 = pops()
            val pop1 = popq()
            val reg0 = genid("%...")
            val reg1 = genid("%reg_")
            asm.p(reg0 + " = bitcast "+llt(pop1._1)+" "+pop1._2+" to "+typ)
            asm.p(reg1 + " = getelementptr inbounds "+typ+" "+reg0+", i64 "+pop2)
            push{reg2=>asm.p(reg2 + " = load "+typ+" "+reg1); t}
        }
        
      case ("astore", t:T) =>
        val typp = llt(Tp(t))
        val pop1 = popq()
        val pop2 = pops()
        val pop3 = popq()
        val reg0 = genid("%...")
        val reg1 = genid("%reg_")
        asm.p(reg0 + " = bitcast "+llt(pop3._1)+" "+pop3._2+" to "+typp)
        asm.p(reg1 + " = getelementptr inbounds "+typp+" "+reg0+", i64 "+pop2)
        asm.p("store "+llt(t)+" "+pop1._2+", "+typp+" "+reg1)
        pushq(pop1)
        
      case ("getfield", idx: String, t: T) =>
        push { r =>
          val a = pops()
          val reg = genid("%...")
          val (t2, s) = offset(t, idx)
          t2 match {
            case Ti(_) | Tf | Td | Tp(_) =>
              asm.p(reg + " = getelementptr inbounds " + llt(Tp(t)) + " " + a + ", i32 0, i32 " + s)
              asm.p(r + " = load " + llt(Tp(t2)) + " " + reg)
              t2
            case _ =>
              asm.p(r + " = getelementptr inbounds " + llt(Tp(t)) + " " + a + ", i32 0, i32 " + s)
              Tp(t2)
          }
        }
      case ("putfield", idx: String, t: T) =>
        val reg = genid("%...")
        val rdx = popq()
        val (t2, s) = offset(t, idx)
        asm.p(reg + " = getelementptr inbounds " + llt(Tp(t)) + " " + pops() + ", i32 0 , i32 " + s)
        asm.p("store " + llt(t2) + " " + rdx._2 + ", " + llt(Tp(t2)) + " " + reg)
        pushq(rdx)

      // new
      case ("newarray", Tp(t)) => // 配列 new malloc
        l1 { (r, a) =>
          val reg = genid("%...")
          val regs = genid("%...")
          asm.p(regs + " = mul i64 " + a + ", " + env.size(t))
          asm.p(reg + " = call noalias i8* @malloc(i64 " + regs + ") nounwind")
          asm.p(r + " = bitcast i8* " + reg + " to " + llt(Tp(t)))
          global_env.add("malloc", TFun(Tp(Ti(8)), List(Ti(64))))
          Tp(t)
        }
      case ("new", t: T) => // new malloc
        push { r =>
          val reg = genid("%...")
          asm.p(reg + " = call noalias i8* @malloc(i64 " + env.size(t) + ") nounwind")
          asm.p(r + " = bitcast i8* " + reg + " to " + llt(Tp(t)) )
          global_env.add("malloc", TFun(Tp(Ti(8)), List(Ti(64))))
          Tp(t)
        }
      case ("gcnew", t: T) => // new malloc
        push { r =>
          val reg = genid("%...")
          asm.p(reg + " = call noalias i8* @newobj(i64 " + env.size(t) + ") nounwind")
          asm.p(r + " = bitcast i8* " + reg + " to " + llt(Tp(t)))
          global_env.add("newobj", TFun(Tp(Ti(8)), List(Ti(64))))
          Tp(t)
        }
      // bin
      case Cst("add", t: Ti) => lbin { (l, c, a) => asm.p(l + " = add " + llt(t) + " " + c + ", " + a); t }
      case Cst("sub", t: Ti) => lbin { (l, c, a) => asm.p(l + " = sub " + llt(t) + " " + c + ", " + a); t }
      case Cst("mul", t: Ti) => lbin { (l, c, a) => asm.p(l + " = mul " + llt(t) + " " + c + ", " + a); t }
      case Cst("div", t: Ti) => lbin { (l, c, a) => asm.p(l + " = sdiv " + llt(t) + " " + c + ", " + a); t }
      case Cst("mod", t: Ti) => lbin { (l, c, a) => asm.p(l + " = srem " + llt(t) + " " + c + ", " + a); t }
      case Cst("shl", t: Ti) => lbin { (l, c, a) => asm.p(l + " = shl " + llt(t) + " " + c + ", " + a); t }
      case Cst("shr", t: Ti) => lbin { (l, c, a) => asm.p(l + " = ashr " + llt(t) + " " + c + ", " + a); t }
      case Cst("ushr", t: Ti) => lbin { (l, c, a) => asm.p(l + " = lshr " + llt(t) + " " + c + ", " + a); t }
      case Cst("and", t: Ti) => lbin { (l, c, a) => asm.p(l + " = and " + llt(t) + " " + c + ", " + a); t }
      case Cst("or", t: Ti) => lbin { (l, c, a) => asm.p(l + " = or " + llt(t) + " " + c + ", " + a); t }
      case Cst("xor", t: Ti) => lbin { (l, c, a) => asm.p(l + " = xor " + llt(t) + " " + c + ", " + a); t }
      case Cst("neg", t: Ti) => l1 { (l, a) => asm.p(l + " = sub " + llt(t) + " 0, " + a); t }

      case Cst("add", t @ (Tf | Td)) => lbin { (l, c, a) => asm.p(l + " = fadd " + llt(t) + " " + c + ", " + a); t }
      case Cst("sub", t @ (Tf | Td)) => lbin { (l, c, a) => asm.p(l + " = fsub " + llt(t) + " " + c + ", " + a); t }
      case Cst("mul", t @ (Tf | Td)) => lbin { (l, c, a) => asm.p(l + " = fmul " + llt(t) + " " + c + ", " + a); t }
      case Cst("div", t @ (Tf | Td)) => lbin { (l, c, a) => asm.p(l + " = fdiv " + llt(t) + " " + c + ", " + a); t }
      case Cst("neg", t @ (Tf | Td)) => l1 { (l, a) => asm.p(l + " = fsub " + llt(t) + " 0.0, " + a); t }
      
      case Cst("add", t @ Tp(t2)) => lbin { (r, a, b) => asm.p(r + " = getelementptr inbounds " + llt(t) + " " + a + ", i64 " + b); t }
      case Cst("sub", t @ Tp(t2)) =>
        lbin { (r, a, b) =>
          val reg = genid("%...")
          asm.p(reg + " = sub i64 0, " + b)
          asm.p(r + " = getelementptr inbounds " + llt(t) + " " + a + ", i64 " + reg)
          t
        }
      // if
      case ("jeq", label: String, jmp: String) =>
        val reg = genid("%reg_")
        asm.p(reg + " = icmp eq i64 " + pops() + ", 0")
        asm.p("br i1 " + reg + ", label %" + label + ", label %" + jmp)
        asm.apply(label + ":")
      case ("jne", label: String, jmp: String) =>
        val reg = genid("%reg_")
        asm.p(reg + " = icmp ne i64 " + pops() + ", 0")
        asm.p("br i1 " + reg + ", label %" + label + ", label %" + jmp)
        asm.apply(label + ":")
      case ("goto", label: String, jmp: String) =>
        asm.p("br label %" + jmp)
        asm.apply(label + ":")
      case ("label", label: String) =>
        asm.p("br label %" + label)
        asm.apply(label + ":")
      case ("phi", l1: String, l2: String, t: T) =>
        val r2 = pops()
        val r1 = pops()
        push { reg => asm.p(reg + " = phi " + llt(t) + " [" + r1 + ", %" + l1 + "], [" + r2 + ", %" + l2 + "]"); t }
      case ("dup") => pushq(peekq())
      case ("dup_s") =>
        ll_emit.stack match {
          case a :: c :: s => ll_emit.stack = a :: c :: a :: s
          case _ => throw new Exception("not enough stack")
        }
      case ("pop") => popq()
      case Cst("not", t: Ti) => not("icmp eq " + llt(t) + " 0, ")
      case Cst("ge", t: Ti) => cmp("icmp sge " + llt(t))
      case Cst("gt", t: Ti) => cmp("icmp sgt " + llt(t))
      case Cst("le", t: Ti) => cmp("icmp sle " + llt(t))
      case Cst("lt", t: Ti) => cmp("icmp slt " + llt(t))
      case Cst("eq", t: Ti) => cmp("icmp eq " + llt(t))
      case Cst("ne", t: Ti) => cmp("icmp ne " + llt(t))

      case Cst("ge", t @ (Tf | Td)) => cmp("fcmp oge " + llt(t))
      case Cst("gt", t @ (Tf | Td)) => cmp("fcmp ugt " + llt(t))
      case Cst("le", t @ (Tf | Td)) => cmp("fcmp ule " + llt(t))
      case Cst("lt", t @ (Tf | Td)) => cmp("fcmp olt " + llt(t))
      case Cst("eq", t @ (Tf | Td)) => cmp("fcmp oeq " + llt(t))
      case Cst("ne", t @ (Tf | Td)) => cmp("fcmp une " + llt(t))

      // cast
      case ("cast", a:T,b:T) =>
        tName(a)+"2"+tName(b) match {
          case ("d2f") => cast("fptrunc", Tf)
          case ("f2d") => cast("fpext", Td)
          case ("l2a") =>
          case ("d2i") => cast("fptosi", Ti(32))
          case ("d2l") => cast("fptosi", Ti(64))
          case ("f2l") => cast("fptosi", Ti(64))
          case ("l2d")|("i2d") => cast("sitofp", Td)
          case ("l2f")|("i2f") => cast("sitofp", Tf)
          case ("b2s") => cast("sext", Ti(16))
          case ("b2i") => cast("sext", Ti(32))
          case ("b2l") => cast("sext", Ti(64))
          case ("s2b") => cast("trunc", Ti(8))
          case ("s2i") => cast("sext", Ti(32))
          case ("s2l") => cast("sext", Ti(64))
          case ("i2b") => cast("trunc", Ti(8))
          case ("i2s") => cast("trunc", Ti(16))
          case ("i2l") => cast("sext", Ti(64))
          case ("l2b") => cast("trunc", Ti(8))
          case ("l2s") => cast("trunc", Ti(16))
          case ("l2i") => cast("trunc", Ti(32))
          case ("a2l") =>
          case ("p2a") =>// cast("bitcast", Tp(Tv))
          case ("p2l") =>
          case "l2l" =>
        }
      case e => return false
    }
    true
  }
  def not(cmp: String) {
    push { r =>
      val reg1 = genid("%...")
      asm.p(reg1 + " = " + cmp + " " + pops())
      asm.p(r + " = zext i1 " + reg1 + " to i64")
      Ti(64)
    }
  }
  def cmp(cmp: String) {
    push { r =>
      val pop2 = pops()
      val pop1 = pops()
      val reg1 = genid("%...")
      asm.p(reg1 + " = " + cmp + " " + pop1 + ", " + pop2)
      asm.p(r + " = zext i1 " + reg1 + " to i64")
      Ti(64)
    }
  }
  def vName(a:String):String = {
      (if(env.map.contains(a)) "%." else "@") + a
  }

  def offset(t: T, x: String): (T, Any) = {
    env.stripType(t) match {
      case TStr(m) =>
        def ck(m1: List[(String, T)], s: Long): (T, Long) = m1 match {
          case List() => throw new Exception("error " + m + " is not have " + x)
          case (name, t) :: xs => if (name == x) (t, s) else ck(xs, s + 1)
        }
        ck(m.toList, 0L)
      case _ => throw new Exception("error")
    }
  }
  def cast(trunc:String, t:T) {
    push { r => val p1 = popq(); asm.p(r + " = "+trunc+" " + llt(p1._1) + " "+ p1._2 + " to "+llt(t)); t }
  }

  def tName2(t: T): String = {
    t match {
      case TDef(id) => tName2(env.find(id))
      case _: TArr => "p"
      case _: TStr => "p"
      case _: TFun => "p"
      case _: Tp => "a"
      case _: Tr => "a"
      case _ => ""
    }
  }
  
}
