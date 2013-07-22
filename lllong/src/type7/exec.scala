package type7

import java.io._

/**
 * プロセス実行
 */
object exec {
  
  /**
   * プロセス実行
   * 
   * @param cmd: String コマンドライン文字列
   * @return (Int, String, String) 実行結果を多値で返却します。(終了コード, 標準出力, 標準エラー出力)
   */
  def apply(cmd: String): (Int, String, String) = {
    import scala.concurrent.ops._

    val p = Runtime.getRuntime().exec(cmd)
    val stdin = future({readAll(p.getInputStream())})
    val stderr = future({readAll(p.getErrorStream())})

    (p.waitFor(), stdin(), stderr())
  }

  /**
   * 値読み込み
   * 
   * 入力InputStreamから全てのデータを読み込み文字列として返却します。
   */
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
