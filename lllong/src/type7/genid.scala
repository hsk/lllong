package type7

/**
 * id生成
 */
object genid {
  /** id */
  var id = 0

  /**
   * ID生成処理のエントリポイント
   * 
   * 指定文字列にユニークな整数を付けて返却します
   */
  def apply(s:String):String = {
    id += 1
    s + id
  }
}