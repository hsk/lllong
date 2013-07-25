package type7

import scala.collection.immutable.ListMap

object pp {

  def apply(e: E): String = {
    g("", "", f(e))
  }

  private def g(a: (String, String, List[String])): String = a match {
    case (l, ns, List()) => l
    case (l, ns, "(" :: ")" :: ls) => g(l + "()", ns, ls)
    case (l, ns, "(" :: a :: ")" :: ls) => g(l + "(" + a + ")", ns, ls)
    case (l, ns, (s @ "(") :: ls) => g(l + s + "\n", ns + "  ", ls)
    case (l, ns, (s @ ",") :: ls) => g(l + s + "\n", ns, ls)
    case (l, ns, (s @ ")") :: ls) => g(l + "\n" + ns.substring(0, ns.length - 2) + s, ns.substring(0, ns.length - 2), ls)
    case (l, ns, s :: ls) => g(l + ns + s, ns, ls)
  }

  private def f(e: E): List[String] = {
    e match {
      case null => List("null")
      case EVar(t, id, i) => "EVar" :: "(" :: f(t) ::: "," :: id :: "," :: f(i) ::: List(")")
      case EVal(t, id, i) => "EVal" :: "(" :: f(t) ::: "," :: id :: "," :: f(i) ::: List(")")
      case EBlock(t, b) => "EBlock" :: "(" :: f(t) ::: f(b) ::: List(")")
      case ELd(t, i) => "ELd" :: "(" :: f(t) ::: "," :: "" + i :: List(")")
      case ELdd(t, i) => "ELdd" :: "(" :: f(t) ::: "," :: "" + i :: List(")")
      case ELds(t, i) => "ELds" :: "(" :: f(t) + "," + i :: List(")")
      case EId(t, i) => "EId" :: "(" :: f(t) ::: "," :: "" + i :: List(")")
      case EArray(t, id, idx) =>
        "EArray" :: "(" :: f(t) ::: "," :: f(id) ::: "," :: f(idx) ::: List(")")
      case EBin(t, t2, op, a, b) =>
        "EBin" :: "(" :: f(t) ::: "," :: f(t2) ::: "," :: op :: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case ENeg(t, a) => "ENeg" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case ENot(t, a) => "ENot" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case EAssign(t, a, b) =>
        "EAssign" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case ENewArray(t, a) => "ENewArray" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case ENew(t) => "ENew" :: "(" :: f(t) ::: List(")")
      case EGCNew(t) => "EGCNew" :: "(" :: f(t) ::: List(")")
      case ERef(t, a) => "ERef" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case EPtr(t, a) => "EPtr" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case EField(t, t2, id: E, idx: String) =>
        "EField" :: "(" :: f(t) ::: "," :: f(t2) ::: "," :: f(id) ::: "," :: idx :: List(")")
      case EArrow(t, t2, id: E, idx: String) =>
        "EArrow" :: "(" :: f(t) ::: "," :: f(t2) ::: "," :: f(id) ::: "," :: idx :: List(")")
      case ETypeDef(t, idx: String) =>
        "ETypeDef" :: "(" :: f(t) ::: "," :: idx :: List(")")
      case ENop(t, s) => "ENop" :: "(" :: f(t) ::: "," :: s :: List(")")
      case ECall(t, n, p) =>
        "ECall" :: "(" :: f(t) ::: "," :: f(n) ::: "," :: f(p) ::: List(")")
      case EFun(t, n, p, b) =>
        "EFun" :: "(" :: f(t) ::: "," :: n :: "," :: f(p) ::: "," :: f(b) ::: List(")")
      case EIf(t, a, b, c) =>
        "EIf" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: "," :: f(c) ::: List(")")
      case EWhile(t, a, b) =>
        "EWhile" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case EDo(t, a, b) =>
        "EDO" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case EFor(t, a, b, c, d) =>
        "EFor" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: "," :: f(c) ::: "," :: f(d) ::: List(")")
      case ESwitch(t, a, b) =>
        "ESwitch" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case EGoto(t, a) =>
        "EGoto" :: "(" :: f(t) ::: "," :: a :: List(")")
      case ELabel(t, i, e) =>
        "ELabel" :: "(" :: f(t) ::: "," :: i :: "," :: f(e) ::: List(")")
      case EBreak(t) => "EBreak" :: "(" :: f(t) ::: List(")")
      case EContinue(t) => "EContinue" :: "(" :: f(t) ::: List(")")
      case ECase(t, a, b) =>
        "ECase" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case ESizeOf(t, a, b) =>
        "ESizeOf" :: "(" :: f(t) ::: "," :: f(a) ::: "," :: f(b) ::: List(")")
      case ERet(t, a) => "ERet" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case ECast(t, a) => "ECast" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case ETuple(t, a) => "ETuple" :: "(" :: f(t) ::: "," :: f(a) ::: List(")")
      case EImport(id) => "EImport" :: "(" :: id :: List(")")
    }
  }

  private def f(p: Map[String, T]): List[String] = {
    "Map" :: "(" :: p.toList.foldRight(List(")")) {
      case ((a, t), List(")")) => a :: "->" :: f(t) ::: List(")")
      case ((a, t), ls) => a :: "->" :: f(t) ::: "," :: ls
    }
  }

  private def f(ls: List[Any]): List[String] = {

    "List" :: "(" :: ls.foldRight(List(")")) {
      case (e: E, ls @ List(")")) => f(e) ::: ls
      case (e: E, ls) => f(e) ::: "," :: ls
      case ((e: E, e2: E), ls @ List(")")) => "(" :: f(e) ::: "," :: f(e2) ::: ")" :: ls
      case ((e: E, e2: E), ls) => "(" :: f(e) ::: "," :: f(e2) ::: ")" :: "," :: ls
    }

  }

  def f(t: T): List[String] = {
    List(t.toString())
  }
}