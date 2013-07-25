package l0

import scala.collection.immutable.ListMap

object pp {
  
  def main(args:Array[String]) {
    println(pp(EFun(Tv, "main", ListMap(), EBlock(List(
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

      )))))
  }
  
  def apply(e: E): String = {
    def g(a:(String,String, List[String])):String = a match {
      case (l,ns, List()) => l
      case (l,ns, "("::")"::ls) => g(l + "()", ns, ls)
      case (l,ns, "("::a::")"::ls) => g(l + "("+a+")", ns, ls)
      case (l,ns, (s@"(")::ls) => g(l + s+"\n", ns+ "  ", ls)
      case (l,ns, (s@",")::ls) => g(l + s+"\n", ns, ls)
      case (l,ns, (s@")")::ls) => g(l + "\n"+ns.substring(0,ns.length-2)+s, ns.substring(0,ns.length-2), ls)
      case (l,ns, s::ls) => g(l + ns+s, ns, ls)
    }
    g("","", f(e))
  }
  
  def f(e: E): List[String] = {
    e match {
      case EBlock(b: List[E]) => "EBlock"::"(" :: f(b) ::: List(")")
      case ELong(i: Long) => "ELong"::"(" :: ""+ i :: List(")")
      case EAdd(a: E, b: E) => "EAdd"::"(" :: f(a) ::: "," :: f(b) ::: List(")")
      case EMul(a: E, b: E) => "EMul"::"(" :: f(a) ::: "," :: f(b) ::: List(")")
      case EVar(id: String, t: T) => "EVar"::"(" :: id :: "," :: f(t) ::: List(")")
      case EId(id: String) => "EId"::"(":: id :: List(")")
      case EAssign(a: E, b: E) => "EAssign"::"(" :: f(a) ::: "," :: f(b) ::: List(")")
      case EFun(t: T, n: String, p: ListMap[String, T], b: E) =>
        "EFun"::"(" :: f(t) ::: "," :: n :: "," :: f(p) ::: "," :: f(b) ::: List(")")
      case ECall(t: T, n: String, p: List[E]) => "ECall"::"(" :: f(t) ::: "," :: n :: "," :: f(p) ::: List(")")
      case EArray(id: String, idx: E) => "EArray"::"(" :: id :: "," :: f(idx) ::: List(")")
      case EField(id: String, idx: String) => "EField"::"(" :: id :: "," :: idx :: List(")")
      case ENop => List("ENop")
    }
  }
  def f(p:ListMap[String, T]):List[String] = {
    "ListMap"::"("::p.toList.foldRight(List(")")){
      case ((a,t),List(")")) => a :: "->" :: f(t) ::: List(")")
      case ((a,t),ls) => a :: "->" :: f(t) ::: "," :: ls
    }
  }
  def f(ls:List[E]): List[String] = {
    "List"::"(":: ls.foldRight(List(")")){
    case (e,ls@List(")")) => f(e):::ls
    case (e,ls) => f(e):::","::ls
      }
  }
  def f(t:T): List[String] = {
    List(t.toString())
  }
}