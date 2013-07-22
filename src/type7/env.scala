package type7
import scala.collection.immutable.ListMap

/**
 * 環境
 */
object env {

  /** 環境保存用データ */
  type envdata = (ListMap[String,T],Map[String,Long],Long)
  /** 環境 */
  var map = ListMap[String, T]()
  /** アドレス */
  var address = Map[String, Long]()
  /** ローカルのスタックサイズ */
  var localSize = 0L
  /** ファイル名 */
  var filename = ""

  /**
   * 環境のコピー
   */
  def copy():envdata = {
    (map,address,localSize)
  }

  /**
   * 環境の読み込み
   */
  def load(e:envdata) {
    e match {
      case (m:ListMap[String,T],a:Map[String,Long],l:Long) =>
        map = m; address = a; localSize = l
    }
  }

  /**
   * 環境の初期化
   */
  def init(p:Map[String,T] = Map()) {
    map = ListMap()
    address = Map[String, Long]()
    localSize = 0L
    for((id,t)<-p) {
      add(id,t)
    }
  }

  /**
   * シンボル検索
   */
  def find(id: String):T = {
    env.map.applyOrElse(id, global_env.find)
  }

  /**
   * 検索してレジスタで返却
   */
  def findR(id: String):R = {
    if(env.map.contains(id)) {
      RL(env.map(id),id)
    } else {
      RG(global_env.find(id),id)
    }
  }
  
  /**
   * 型の追加
   */
  def add(id: String, t: T) {
    map = map + (id -> t)
    localSize += size(t)
    address = address + (id -> localSize)
    llemit.p(t)
  }

  /**
   * 型定義追加
   */
  def addTypeDef(id: String, t: T) {
    map = map + (id -> t)
  }

  /**
   * 型のTDefを消し、生のデータを返します。
   * 
   * ただし、再帰的な型名があった場合はそのままの型名で返却します。
   * さもないと、無限ループしてしまいます。
   */
  def stripType(t:T,set:Set[String] = Set()):T = {
    t match {
      case TDef(id) => if (set.contains(id)) t else stripType(env.find(id),set + id)
      case t @ TStr(m) => t.copy(m.map{case (id,t)=>(id,stripType(t, set))})
      case t @ TArr(t1, size) => t.copy(stripType(t1, set), size)
      case t @ Tp(t1) => t.copy(stripType(t1, set))
      case _ => t
    }
  }

  /**
   * サイズ計算
   */
  def size(t: T): Long = t match {
    case Ti(i) => i / 8
    case Tu(i) => i / 8
    case Tf => 4
    case Td => 8
    case Tp(_) => 8
    case TDef(id) => size(env.find(id)) 
    case TArr(t, s) => size(t) * s
    case TStr(m) => m.toList.foldLeft(0L) { case (a, (_, b)) => a + size(b) }
    case _:TFun => 8
    case Tn => -1
    case _ => throw new Exception("error")
  }

  /**
   * アドレスの取得
   */
  def addrs(a:String):String = {
    val a2 = address.getOrElse(a, -1)
    if (a2 == -1) {
      if(global_env.map.contains(a)) {
        "_" + a + "(%rip)"
      } else {
        throw new Exception("error not found address " + a)
      }
    }else "-"+a2+"(%rbp)"
  }
}

/**
 * グローバルな環境
 */
object global_env {


  /** グローバルなシンボルテーブル */
  var map = Map[String,T]()

  /** 構造体のレジスタ名へのmap */
  var structs = Map[T,R]()

  init()

  /**
   * 初期化
   */
  def init() {
    map = Map[String,T](
      "println"->TFun(Tv,List(Tp(Tu(8)))),
      "print_b"->TFun(Tv,List(Ti(8))),
      "print_s"->TFun(Tv,List(Ti(16))),
      "print_i"->TFun(Tv,List(Ti(32))),
      "print_l"->TFun(Tv,List(Ti(64))),
      "print_f"->TFun(Tv,List(Tf)),
      "print_d"->TFun(Tv,List(Td)),
      "char" -> Tu(8),
      "byte" -> Ti(8),
      "short" -> Ti(16),
      "int" -> Ti(32),
      "long" -> Ti(64),
      "double" -> Td,
      "float" -> Tf
    )
    structs = Map[T,R]()
  }
  
  /**
   * シンボルを追加
   */
  def add(id:String, t:T) {
    map = map + (id -> t)
  }

  /**
   * 型の追加
   */
  def addTypeDef(id: String, t: T) {
    map = map + (id -> t)
    llemit.p(t)
  }

  /**
   * シンボルを検索
   */
  def find(id: String):T = {
    map(id)
  }

}
