package type7

import java.io._

/**
 * シンプルなメイン関数
 */
object main {

  /**
   * メイン
   */
  def main(argv:Array[String]) {
    val prg = exec.readAll(new FileInputStream(argv(0)))
    val st = compact.parse(prg)
    val ast = transduce(st)
    val ast2 = alpha(ast)
    val tast = typing(ast2)
    val llcodes = kNormal(tast)
    val llcodes2 = constFold(llcodes)
    llemit("e.ll", llcodes2)
    exec("llc -march=x86-64 e.ll -o e.s")
    exec("gcc -m64 e.s lib/gc.c lib/stdio.c")
  }
}

/**
 * 本格的なメイン関数
 */
object main2 {

  var debug = false
  
  /**
   * コンパイル
   */
  def comp(sname:String, opt:Opts, src:String) {
    // パース
    val ast:Prog = opt.p match {
      case false =>
        val st = compact.parse(src); if(debug) println("st="+st)
        transduce(st)
      case true => throw new Exception("not support")// parser.parse(src).get
    }
    if (debug) println("ast="+ast)
    // 型付け
    val ast2 = alpha(ast)
    val tast = typing(ast2); if (debug) println("tast="+tast)
    
    val lname = sname.replaceAll(".s$", ".ll")

    // コンパイル
    if(opt.v=="1") {
      val pcodes = type7.stackMachine.compile(tast)
      type7.stackMachine.ll_emit(lname, pcodes)
    } else {
      val llcodes = kNormal(tast)
      val llcodes2 = constFold(llcodes)
      llemit(lname, llcodes2)
    }
    
    val cmd = "llc -march="+opt.arch+" "+lname+ " -o "+sname +getLCCOption(opt.arch)
    if (debug) println(cmd)
    exec(cmd) match {
      case (0,_,_) =>
      case (_,output,error) =>println(output); throw new Exception(error)
    }
    // アセンブル
    if(!opt.s) {
      val oname = sname.replaceAll(".s$", ".o")
      val cmd = "gcc -c -m"+opt.bit+" " + sname + " -o "+oname
      if (debug) println(cmd)
      exec(cmd) match {
        case (0,_,_) => //new File(sname).delete()
        case (_,output,error) => println(output); throw new Exception(error)
      }
    }
  }

  /**
   * コマンドラインオプション
   * 
   * デフォルト値に設定されている値がデフォルト値です
   */
  case class Opts(
      files:List[String]= List(),
      out: String = null,
      framework: String = "",
      link: Boolean = true,
      s: Boolean = false,
      run: Boolean = false,
      p: Boolean = false,
      llvm: Boolean = false,
      v: String = "2",
      debug: Boolean = false,
      arch:String = "x86-64",
      bit:Int = 64
  )

  import scala.annotation.tailrec
  
  /**
   * オプションパース＆値設定処理
   * 
   * 末尾再帰最適化されたステートマシンとして実装してあります
   */
  @tailrec
  def opts(args:List[String], m:Opts = Opts()) :Opts = {
    args match {
      case "-c"::xs => opts(xs, m.copy(link = false))
      case "-S"::xs => opts(xs, m.copy(link = false, s = false))
      case "-run"::xs => opts(xs, m.copy(run = true))
      case "-d"::xs => opts(xs, m.copy(debug = true))
      case "-o"::o::xs => opts(xs, m.copy(out = o))
      case "-p"::xs => opts(xs, m.copy(p = true))
      case "-llvm"::xs => opts(xs, m.copy(llvm = true))
      case "-v"::v::xs => opts(xs, m.copy(v = v))
      case "-framework"::f::xs => opts(xs, m.copy(framework = m.framework + " -framework "+f))
      case "-march"::arch::xs => opts(xs, m.copy(arch=getArch(arch), bit= getArchBit(getArch(arch))))
      case n::xs => opts(xs, m.copy(files = n::m.files))
      case List() => m
    }
  }

  /**
   * アーキティクチャを標準化する
   * 
   * @param arch:String アーキティクチャ x86 | x86-64 | i386
   * @return Int ビット数 32 | 64
   */
  private def getArch(arch:String):String = {
    arch match {
      case "i386" => "x86"
      case "amd64" => "x86-64"
      case arch => arch
    }
  }

  /**
   * アーキティクチャごとのビット数取得
   * 
   * @param arch:String アーキティクチャ x86 | x86-64
   * @return Int ビット数 32 | 64
   */
  private def getArchBit(arch:String):Int = {
    arch match {
      case "x86" => 32
      case "x86-64" => 64
      case _ => throw new Exception("error "+arch+" is unsupport arch.")
    }
  }

  /**
   * LCCの追加オプション取得
   * 
   * @param arch:String アーキティクチャ x86 | x86-64
   * @return String 追加オプション文字列
   */
  private def getLCCOption(arch:String):String = {
    opt.arch match {
      case "x86" => " -mattr=-avx"
      case "x86-64" => " -mattr=-avx"
      case _ => ""
    }
  }
  /** 引数オプション */
  var opt:Opts = null

  /**
   * メイン関数
   */
  def main(args:Array[String]) {
    if (System.getProperty("os.name").matches("^Windows.*$")) {
      opt = opts(args.toList, Opts(arch="x86",bit=32))
    } else {
      opt = opts("-march"::System.getProperty("os.arch").replaceAll("_","-")::args.toList)
    }
    debug = opt.debug

    try {
      if(opt.files == List()) {
        println("usage: dtype [-c][-run][-d][-o filename][-march x86|x86-64] filenames...")
        return
      }
      val objs = (opt.files.foldRight(List[String]()) {
        (name, fs) =>
          if (!name.matches(".*\\.lll$")) {
            throw new Exception("error! file extension need .lll, but filename is " + name)
          }
          if (debug) println("file ", name)
          val sname = name.replaceAll(".lll$", ".s")
          val oname = name.replaceAll(".lll$", ".o")
          val src = exec.readAll(new FileInputStream(name))
          imports = imports + name
          env.filename = name
          comp(sname, opt, src)
          oname::fs
      })
  
      if (opt.link) {
        val lib1 = this.getClass.getClassLoader().getResource("type7/main$.class").toString()
        val lib = lib1
            .replaceAll("^jar:file:(.*)type7.jar!.*$","$1lib")
            .replaceAll("^file:(.*?)/bin/type7/[^/\\\\]*\\.class$","$1/lib")
            .replaceAll("^/([a-zA-Z0-9_]+:)", "$1")
  //      jar:file:/Users/sakurai/Documents/workspace/lllong/bin/test/type7.jar!/type7/main$.class
   //     file:/Users/sakurai/Documents/workspace/lllong/bin/type7/main$.class
  
        val out2 = if(opt.out == null) objs.head else opt.out
        val out3 = out2.replaceAll("(\\.lll|\\.o)$", "")
        val cmd = (objs.foldRight("gcc -m"+opt.bit+" -o " + out3) {
          (file, cmd) => cmd + " " + file
        }) + " " + lib + "/gc.c " + lib + "/stdio.c " + opt.framework
        
        if(debug) println(cmd)
        println(exec(cmd))
        if (opt.run) {
          val (code, output, err) = exec("./" + out3)
          println(output)
        }
      }
    } catch {
    case e:Throwable =>
      if(debug)e.printStackTrace()
      else println(e.toString())
    }
  }
  var imports = Set[String]()

  def importFile(file:String) {
    // 再度読み込み防止
    if(imports.contains(file)) return

    imports = imports + file
    
    val src = exec.readAll(new FileInputStream(file))
    // パース
    val st = compact.parse(src)
    val ast = transduce(st)
    // 型付け
    typing.checkGlobalType(ast)
  }
}
