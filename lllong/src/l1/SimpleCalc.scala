package l1
import scala.collection.immutable.ListMap

sealed trait T
case object Tv extends T
case class Ti(i:Int) extends T
case class TFun(t: T, p: List[T]) extends T
case class TArr(t: T, size:Long) extends T
case class TStr(members: ListMap[String, T]) extends T
case class Tp(t:T) extends T

sealed trait E

case class EBlock(b: List[E]) extends E
case class ELong(i: Long) extends E
case class EAdd(a: E, b: E) extends E
case class EMul(a: E, b: E) extends E
case class EVar(id: String, t: T) extends E
case class EId(id: String) extends E
case class EAssign(a: E, b: E) extends E
case class EFun(t: T, n: String, p: ListMap[String, T], b: E) extends E
case class ECall(t: T, n: String, p: List[E]) extends E
case class EArray(id:String, idx:E) extends E
case class EField(id: String, idx: String) extends E
//case class EIf(a:E,b:E,c:E) extends E
case object ENop extends E

object EPrint{
  def apply(e:E):E = {
    ECall(Tv, "print_l", List(e))
  }
}

object env {
  type envdata = ListMap[String, T]
  var map = ListMap[String, T]()
  def add(id: String, t: T) {
    map = map + (id -> t)
    t match {
      case TStr(m) =>
        if(!global_env.ts.contains(t))
          global_env.ts = global_env.ts + (t->genid("%struct..anon"))
      case _ =>
    }
  }
  def init(p: envdata = ListMap()) {
    load(p)
  }
  def copy(): ListMap[String, T] = {
    map
  }
  def load(e: envdata) {
    map = e
  }
  def getFieldNo(id: String, field: String):Int = {
    map(id) match {
      case TStr(m) =>
        def getNo(no:Int,m:List[(String,T)]):Int = {
          m match {
            case List() => throw new Exception("not found "+field)
            case (name,t)::xs if (name == field)=> no
            case x::xs => getNo(no+1,xs)
            case _ => throw new Exception("error")
          }
        }
        getNo(0, m.toList)
      case _ => throw new Exception("error")
    }
  }
}

object global_env {
  var ts = Map[T,String]()
  
  var map = Map[String, T]()
  def add(id: String, t: T) {
    map = map + (id -> t)
  }
}

import java.io._

object asm {
  var p: PrintWriter = null
  def open(file: String) {
    p = new PrintWriter(new BufferedWriter(new FileWriter(file)))
  }

  var indent: String = ""

  def apply(s: String, n: String = "") {
    val v = indent + s + "\t" + n + "\n"
    p.print(v)
  }
  def label(s: String) {
    asm.indent = "";
    apply(s)
    asm.indent = "\t";
  }
  def close() {
    p.close()
  }
}

object genid {
  var id = 0
  def apply(s: String): String = {
    id += 1
    s + id
  }
}

object exec {
  def apply(cmd: String): (Int, String, String) = {
    val p = Runtime.getRuntime().exec(cmd)
    val stdin = (readAll(p.getInputStream()))
    val stderr = (readAll(p.getErrorStream()))
    (p.waitFor(), stdin, stderr)
  }

  def readAll(p: InputStream): String = {
    def f(s: String, i: BufferedReader): String = {
      i.readLine() match {
        case null => s
        case a => f(s + a + "\n", i)
      }
    }
    f("", new BufferedReader(new InputStreamReader(p)))
  }
}
