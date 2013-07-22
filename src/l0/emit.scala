package l0

import scala.collection.immutable.ListMap

object test {
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
        EPrint(EAdd(EField("b", "x"), EField("b", "y")))//,
//        ECall(Tv, "print_l",List(EIf(ELong(1),ELong(14),ELong(214))))
      )))
      ,

      EFun(Ti(64), "add", ListMap("a" -> Ti(64), "b" -> Ti(64)),
        EAdd(EId("a"), EId("b")))
        
      )
    val codes = compile(ast)
    println("# l=" + codes)
    emit("e.s", codes)
    println(exec("llc e.s"))
    println(exec("llvm-gcc -m64 e.s.s -o e"))
    println(exec("./e"))
  }
}

object compile {

  def apply(b: E): List[Any] = {
    f(b, List())
  }

  def apply(b: List[E]): List[Any] = {
    b.foreach { c(_) }
    b.flatMap { g(_, List()) }
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

  def g(e: E, l: List[Any]): List[Any] = {
    e match {
      case EVar(id, t: TFun) => l
      case EFun(t, n, p, b) =>
        env.init(p)
        val body = f(b, ("leave", e) :: l)
        ("enter", e, env.copy()) :: body
      case _ => throw new Exception("error")
    }
  }
  def f(e: E, l: List[Any]): List[Any] = {
    e match {
      case EVar(id, t) => env.add(id,t); l
      case ELong(i) => ("ldc2_w", i) :: l
      case EAdd(a, b) => f(a, f(b, "ladd" :: l))
      case EMul(a, b) => f(a, f(b, "lmul" :: l))
      case EBlock(l1) => l1.flatMap { case e => f(e, List()) } ::: l
      case ECall(t, n, l1) => l1.flatMap { case e => f(e, List()) } ::: ("call", n) :: l
      case EField(id, idx) => ("getField", id, idx) :: l
      // 構造体の値設定
      case EAssign(EField(id, idx), b) => f(b, ("putField", id, idx) :: l)
      case EArray(id, idx) => f(idx,("laload",id)::l)
      // 配列の値設定
      case EAssign(EArray(id, idx), b) => f(idx, f(b,("lastore",id)::l))
      case EId(i) => ("lload", i) :: l
/*      case EIf(a,b,c) =>
        val id0 = genid("ok")
        val id1 = genid("else")
        val id2 = genid("endif")
        f(a,("bne", id0, id1)::("label", id0)::f(b,("goto",id2)::("label",id1)::f(c,("goto",id2)::("label",id2)::("phi", id0, id2)::l)))*/
      case _ => throw new Exception("error")
    }
  }
}

object emit {
  var stack = List[String]()
  def pushq(a: String) {
    stack = a :: stack
  }
  def popq(): String = {
    stack match {
      case List() => throw new Exception("stack is empty")
      case x :: xs => stack = xs; x
    }
  }
  def lbin(f: (String, String, String) => Unit) {
    val c = popq()
    val a = popq()
    val l = genid("%reg_")
    f(l, c, a)
    pushq(l)
  }
  def push(f: (String) => Unit) {
    val reg = genid("%reg_")
    f(reg)
    pushq(reg)
  }
  def llt(t: T): String = t match {
    case Tv => "void"
    case TArr(t, n) => "[" + n + " x " + llt(t) + "]"
    case Ti(i) => "i"+i
    case TStr(m) => global_env.ts(t)
    case _: TFun => "i64"
    case _:Tp => throw new Exception("error type "+t)
  }
  def emit(c: Any) {
    //println("f " + c)
    c match {
      case ("ldc2_w", a) => push { r => asm(r + " = add nuw i64 0, " + a) }
      case ("ladd") => lbin { (l, c, a) => asm(l + " = add i64 " + c + ", " + a) }
      case ("lsub") => lbin { (l, c, a) => asm(l + " = sub i64 " + c + ", " + a) }
      case ("lmul") => lbin { (l, c, a) => asm(l + " = mul i64 " + c + ", " + a) }
      case ("ldiv") => lbin { (l, c, a) => asm(l + " = sdiv i64 " + c + ", " + a) }
      case ("printl") => asm("call void @print_l(i64 " + popq() + ") nounwind ssp")
      case ("lload", a: String) => push { r => asm(r + " = load i64* %." + a) }
      case ("lstore", a: String) => asm("store i64 " + popq() + ", i64* %." + a)
      case ("enter", EFun(t, name, p, _), e: env.envdata) =>
        env.load(e)
        val prms = p.foldLeft("") {
          case ("", (id, t)) => llt(t) + " %.." + id
          case (l, (id, t)) => l + ", " + llt(t) + " %.." + id
        }
        asm.label("define " + llt(t) + " @" + name + "(" + prms + ") nounwind ssp {")
        asm.label("entry:")
        e.foreach { case (a, t) => asm("%." + a + " = alloca "+llt(t)) }
        p.foreach {
          case (id, t) =>
            asm("store " + llt(t) + " %.." + id + ", " + llt(t) + "* %." + id)
        }
      case ("leave", EFun(t, name, p, _)) =>
        t match {
          case Tv => asm("ret void")
          case _ => asm("ret " + llt(t) + " " + popq())
        }
        asm.label("}")
      case ("call", n: String) =>
        global_env.map(n) match {
          case TFun(t, p) =>
            val prms = p.foldLeft("") {
              case ("", t1) => llt(t1) + " " + popq()
              case (l, t1) => l + ", " + llt(t1) + " " + popq()
              case _ => throw new Exception("error")
            }
            t match {
              case Tv => asm("call " + llt(t) + " @" + n + "(" + prms + ") nounwind ssp")
              case _ => push { l => asm(l + " = call " + llt(t) + " @" + n + "(" + prms + ") nounwind ssp") }
            }
          case _ => throw new Exception("error")
        }
      case ("laload", a:String) =>
        val reg1 = genid("%reg_")
        asm(reg1 + " = getelementptr inbounds "+llt(env.map(a))+"* %."+a+", i64 0, i64 "+popq())
        push{reg2=>asm(reg2 + " = load i64* "+reg1+", align 8")}
      case ("lastore", a:String) =>
        val pop1 = popq()
        val pop2 = popq()
        val reg1 = genid("%reg_")
        asm(reg1 + " = getelementptr inbounds "+llt(env.map(a))+"* %."+a+", i64 0, i64 "+pop2)
        asm("store i64 "+pop1+", i64* "+reg1+", align 8")
      case ("getField", a: String, b: String) =>
        val name = global_env.ts(env.map(a))
        val reg = genid("%reg_")
        asm(reg + " = getelementptr inbounds "+name+"* %."+a+", i32 0, i32 "+env.getFieldNo(a,b))
        val t = llt(env.map(a) match {case TStr(m) => m(b) case _ => throw new Exception("error")})
        push{r=>asm(r + " = load "+t+"* "+reg)}
        
      case ("putField", a: String, b: String) =>
        val name = global_env.ts(env.map(a))
        val reg = genid("%reg_")
        asm(reg + " = getelementptr inbounds "+name+"* %."+a+", i32 0, i32 "+env.getFieldNo(a,b))
        val t = llt(env.map(a) match { case TStr(m) => m(b) case _ => throw new Exception("error")})
        asm("store "+t+" "+popq()+", "+t+"* "+reg)
      case ("bne", label1:String, label:String) =>
        val reg = genid("%reg_")
        asm(reg + " = icmp ne i64 "+popq()+", 0")
        asm("br i1 "+reg+", label %"+label1+", label %"+label)
      case ("goto", label:String) =>
        asm("br label %"+label)
      case ("label", label:String) =>
        asm.label(label+":")
      case ("phi", l1:String, l2:String) =>
        val r2 = popq()
        val r1 = popq()
        push{reg=>asm(reg + " = phi i64 ["+r1+", %"+l1+"], ["+r2+", %"+l2+"]")}
      case e => throw new Exception("unknown instruction " + e)
    }
  }

  def g(l: List[Any]) {
    l match {
      case List() =>
      case h :: t => emit(h); g(t)
    }
  }

  def apply(file: String, l: List[Any]) {
    asm.open(file)
    asm.indent = "\t"
    global_env.ts.foreach {
      case(t,name) =>
        t match {
          case TStr(m) =>
            val members = m.foldLeft("") {
              case ("",(n,t)) => llt(t)
              case (l,(n,t)) => l + ", "+ llt(t)
              case _ => throw new Exception("error")
            }
            asm(name + " = type {" + members + "}")
          case _ => throw new Exception("error")
        }
    }

    g(l)

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
