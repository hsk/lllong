package mqo
import scala.io.Source
import util.parsing.combinator._
import util.parsing.input.Positional

object Mqo extends RegexParsers {

  sealed trait Chunk
  case class Material(ds: List[(String, List[Any])]) extends Chunk
  case class Scene(ds: List[Data]) extends Chunk
  case class Obj(id: String, ds: List[Any]) extends Chunk
  case object Eof extends Chunk

  sealed trait Data
  case class Str(str: String) extends Data
  case class Lng(int: Int) extends Data
  case class Dbl(double: Double) extends Data
  case class Lst(cs: List[Data]) extends Data

  def id = "[a-zA-Z_][a-zA-Z_0-9]*".r
  def fnum: Parser[Double] = "-?[0-9]+\\.[0-9]+".r ^^ { case a => a.toDouble }
  def num: Parser[Int] = "-?[0-9]+".r ^^ { case a => a.toLong.asInstanceOf[Int] }
  def str = "\"" ~> """([^"]|\\")*""".r <~ "\""

  def mqo = header ~> rep(obj | scene | material | eof)

  def header = ("Metasequoia Document") ~ ("Format" ~> id) ~ ("Ver" ~> fnum)
  def scene: Parser[Chunk] = "Scene" ~> "{" ~> rep(data) <~ "}" ^^ { case a => Scene(a) }
  def material: Parser[Chunk] = "Material" ~> num ~> ("{" ~> mate_datas <~ "}") ^^ { case a => Material(a) }
  def mate_datas: Parser[List[(String, List[Any])]] = rep(str ~ rep(mate_data) ^^ { case a ~ b => (a, b) })
  def mate_data: Parser[Any] =
    "shader" ~ ("(" ~> num <~ ")") ^^ { case a ~ b => (a, b) } |
      "vcol" ~ ("(" ~> num <~ ")") ^^ { case a ~ b => (a, b) } |
      "dbls" ~ ("(" ~> num <~ ")") ^^ { case a ~ b => (a, b) } |
      "col" ~ ("(" ~> (fnum ~ fnum ~ fnum ~ fnum) <~ ")") ^^ { case a ~ (b ~ c ~ d ~ e) => (a, (b, c, d, e)) } |
      "dif" ~ ("(" ~> fnum <~ ")") ^^ { case a ~ b => (a, b) } |
      "amb" ~ ("(" ~> fnum <~ ")") ^^ { case a ~ b => (a, b) } |
      "emi" ~ ("(" ~> fnum <~ ")") ^^ { case a ~ b => (a, b) } |
      "spc" ~ ("(" ~> fnum <~ ")") ^^ { case a ~ b => (a, b) } |
      "power" ~ ("(" ~> fnum <~ ")") ^^ { case a ~ b => (a, b) } |
      "tex" ~ ("(" ~> str <~ ")") ^^ { case a ~ b => (a, b) } |
      "alpha" ~ ("(" ~> str <~ ")") ^^ { case a ~ b => (a, b) } |
      "bump" ~ ("(" ~> str <~ ")") ^^ { case a ~ b => (a, b) } |
      "proj_type" ~ ("(" ~> num <~ ")") ^^ { case a ~ b => (a, b) } |
      "proj_pos" ~ ("(" ~> (fnum ~ fnum ~ fnum) <~ ")") ^^ { case a ~ (b ~ c ~ d) => (a, (b, c, d)) } |
      "proj_scale" ~ ("(" ~> (fnum ~ fnum ~ fnum) <~ ")") ^^ { case a ~ (b ~ c ~ d) => (a, (b, c, d)) } |
      "proj_angle" ~ ("(" ~> (fnum ~ fnum ~ fnum) <~ ")") ^^ { case a ~ (b ~ c ~ d) => (a, (b, c, d)) }

  def obj: Parser[Chunk] = "Object" ~> str ~ ("{" ~> rep(obj_data) <~ "}") ^^ { case a ~ b => Obj(a, b) }

  def obj_data: Parser[Any] =
    "uid" ~ num ^^ { case a ~ b => (a, b) } |
      "depth" ~ num ^^ { case a ~ b => (a, b) } |
      "folding" ~ num ^^ { case a ~ b => (a, b) } |
      "scale" ~ fnum ~ fnum ~ fnum ^^ { case a ~ b ~ c ~ d => (a, (b, c, d)) } |
      "rotation" ~ fnum ~ fnum ~ fnum ^^ { case a ~ b ~ c ~ d => (a, (b, c, d)) } |
      "translation" ~ fnum ~ fnum ~ fnum ^^ { case a ~ b ~ c ~ d => (a, (b, c, d)) } |
      "patch" ~ num ^^ { case a ~ b => (a, b) } |
      "patchtri" ~ num ^^ { case a ~ b => (a, b) } |
      "segment" ~ num ^^ { case a ~ b => (a, b) } |
      "visible" ~ num ^^ { case a ~ b => (a, b) } |
      "locking" ~ num ^^ { case a ~ b => (a, b) } |
      "shading" ~ num ^^ { case a ~ b => (a, b) } |
      "facet" ~ fnum ^^ { case a ~ b => (a, b) } |
      "color" ~ fnum ~ fnum ~ fnum ^^ { case a ~ b ~ c ~ d => (a, (b, c, d)) } |
      "color_type" ~ num ^^ { case a ~ b => (a, b) } |
      "mirror" ~ num ^^ { case a ~ b => (a, b) } |
      "mirror_axis" ~ num ^^ { case a ~ b => (a, b) } |
      "mirror_dis" ~ fnum ^^ { case a ~ b => (a, b) } |
      "vertex" ~ num ~ ("{" ~> rep(fnum ~ fnum ~ fnum ^^ { case a ~ b ~ c => (a, b, c) }) <~ "}") ^^ { case a ~ b ~ c => (a, c) } |
      "BVertex" ~ num ~ ("{" ~> rep(fnum ~ fnum ~ fnum ^^ { case a ~ b ~ c => (a, b, c) }) <~ "}") ^^ { case a ~ b ~ c => (a, c) } |
      "face" ~ num ~ ("{" ~> rep(faceChunk) <~ "}") ^^ { case a ~ b ~ c => (a, c) }

  def faceChunk: Parser[Any] = num ~> rep(
    "V" ~ ("(" ~> rep(num) <~ ")") ^^ { case a ~ b => (a, b) } |
      "M" ~ ("(" ~> num <~ ")") ^^ { case a ~ b => (a, b) } |
      "UV" ~ ("(" ~> rep(fnum ~ fnum ^^ { case a ~ b => (a, b) }) <~ ")") ^^ { case a ~ b => (a, b) } |
      "COL" ~ ("(" ~> rep(num) <~ ")") ^^ { case a ~ b => (a, b) } |
      "CRS" ~ ("(" ~> rep(num) <~ ")") ^^ { case a ~ b => (a, b) })

  def eof: Parser[Chunk] = "Eof" ^^ { case a => Eof }
  def datas: Parser[Data] = rep(data) ^^ { case a => Lst(a) }
  def data: Parser[Data] = (id ^^ { Str(_) } | fnum ^^ { Dbl(_) } | num ^^ { Lng(_) }) | ("{" ~> datas <~ "}")

  def parse(input: String) = {
    parseAll(mqo, input)
  }
}

object Transduce {
  case class MQO2(mates: List[(String, Map[String, Any])] = List(), objs: List[(String, Map[String, Any])] = List())
  import scala.annotation.tailrec

  @tailrec
  def chunks(data: List[Mqo.Chunk], mqo: MQO2 = MQO2()): MQO2 = {
    data match {
      case List() => mqo
      case Mqo.Eof :: xs => chunks(xs, mqo)
      case Mqo.Scene(_) :: xs => chunks(xs, mqo)
      case Mqo.Obj(id, ds) :: xs => chunks(xs, mqo.copy(objs = mqo.objs ::: List((id, objs(ds, Map[String, Any]())))))
      case Mqo.Material(ds) :: xs =>
        val ms = ds.foldLeft(mqo.mates) { case (m, (id, ds)) => m ::: List((id, mates(ds, Map[String, Any]()))) }
        chunks(xs, mqo.copy(mates = ms))
    }
  }

  @tailrec
  def faces(ds: List[Any], m: Map[String, Any]): Map[String, Any] = {
    ds match {
      case List() => m
      case (a: String, b) :: xs => faces(xs, m + (a -> b))
      case _ => throw new Exception("error")
    }
  }

  @tailrec
  def objs(ds: List[Any], m: Map[String, Any]): Map[String, Any] = {
    ds match {
      case List() => m
      case ("face", b: List[Any]) :: xs => objs(xs, m + ("face" -> b.map { case (i: List[Any]) => faces(i, Map[String, Any]()) }))
      case (a: String, b) :: xs => objs(xs, m + (a -> b))
      case _ => throw new Exception("error")
    }
  }

  @tailrec
  def mates(xs: List[Any], m: Map[String, Any]): Map[String, Any] = {
    xs match {
      case List() => m
      case (id: String, a) :: xs => mates(xs, m + (id -> a))
      case _ => throw new Exception("error")
    }
  }
}

object Convert {
  def main(args: Array[String]) {
    val data = Mqo.parse(Source.fromFile("sample/title.mqo", "shift-jis").getLines().fold("") { (a, b) => a + b + "\n" })
    //    println(data);
    val mqo2 = Transduce.chunks(data.get)
    /*
    println(mqo2)
    mqo2.mates.foreach {
      case (a, b) => println(a + "=" + b)
    }
    mqo2.objs.foreach {
      case (a, b) => println(a + "=" + b)
    }

    def typ(t:Any):String = {
      t match {
        case _:Int => "int"
        case _:Double => "double"
        case a:List[Any] => "Ptr["+typ(a.head)+"]"
        case (a,b,c,d) => "d4"
        case (a,b,c) => "d3"
        case a:Map[String,Any] => "Face"
      }
    }
    println("typedef Mat = struct {");
    mqo2.mates.head._2.asInstanceOf[Map[String,Any]].foreach{
      case (k,v) => println("  "+ k + ":" + typ(v))
    }
    println("}")
    mqo2.mates.foreach {
      case (id, b) => println("var " + id + ":Mat;")
    }
    mqo2.mates.foreach {
      case (id, b) => b.foreach{
        case (k,v) => println(id+"."+k+"="+v+";")
      }
    }
    println("typedef Obj = struct {");
    mqo2.objs.head._2.foreach {
      case (a, b) => println("  "+a+":"+typ(b))
    }
    println("}")

    mqo2.objs.foreach {
      case (a, b) => println("var " + a + ":Obj;")
    }*/

    mqo2.objs.foreach {
      case (id, b) =>
        //        println("//def "+id+"(){");
        val vxs = (b("vertex").asInstanceOf[List[(Double, Double, Double)]])

        (b("face").asInstanceOf[List[Map[String, Any]]]) foreach {
          case a =>
            println("  glBegin(GL_POLYGON)");
            println("    color" + mqo2.mates(a("M").asInstanceOf[Int])._2("col"));
            val v = (a("V").asInstanceOf[List[Int]])
            val va = v.toArray
            //              print("V="+v)
            println("    glNormal3d" + normal(vxs(va(2)), vxs(va(1)), vxs(va(0))))
            v foreach {
              case n => println("    glVertex3d" + vxs(n))
            }
            println("  glEnd()");
        }
      //        println("//}")
    }

  }
  def normal(
    p1: (Double, Double, Double),
    p2: (Double, Double, Double),
    p3: (Double, Double, Double)): (Double, Double, Double) = {
    val v1 = (p1._1 - p2._1, p1._2 - p2._2, p1._3 - p2._3)
    val v2 = (p3._1 - p2._1, p3._2 - p2._2, p3._3 - p2._3)
    val cross = (
      (v2._2 * v1._3 - v2._3 * v1._2), (v2._3 * v1._1 - v2._1 * v1._3), (v2._1 * v1._2 - v2._2 * v1._1))
    val length = Math.sqrt(cross._1 * cross._1 + cross._2 * cross._2 + cross._3 * cross._3)
    if (length == 0.0) {
      throw new Exception("length zero")
    }
    (cross._1 / length, cross._2 / length, cross._3 / length)
  }

}
