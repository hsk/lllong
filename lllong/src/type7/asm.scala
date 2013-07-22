package type7

import java.io._

/** アセンブラ出力用オブジェクト
 * 
 * asm.open("ファイル名") // ファイルをオープン<br/>
 * asm("ラベル:") // ラベルやグローバル変数の出力<br/>
 * asm.`_``_`("プログラム") // 関数内の通常の出力<br/>
 * asm.close() // ファイルをクローズ<br/>
 * asm.obStart() // バッファリングを開始。ファイルに出力せずにバッファに保存<br/>
 * asm.p("test") // バッファリングされるのでファイルに出力されない<br/>
 * val s = asm.obEnd() // バッファリングを終了。文字列を取得します<br/>
 */
object asm {

  /**
   * ファイル出力用のライター
   */ 
  var writer: PrintWriter = null

  /**
   * バッファリング用変数
   */
  var buffer: StringBuilder = null

  /**
   * ファイルオープン
   * 
   * @param file: String ファイル名
   */
  def open(file: String) {
    buffer = null
    writer = new PrintWriter(new BufferedWriter(new FileWriter(file)))
  }

  /**
   * バッファリング開始
   */
  def obStart() {
    buffer = new StringBuilder()
  }

  /**
   * バッファリング終了
   *
   * @return バッファ出力結果
   */
  def obEnd(): String = {
    val b = buffer
    buffer = null
    b.toString()
  }

  /**
   * ネスト付き出力
   *
   * @param s: String 出力文字列
   * @param n: String = "" タブを挟んで更に出力
   */
  def p(s: String, n: String = "") {
    val v = "  " + s + (if (n == "") "" else "\t") + n
    apply(v)
  }

  /**
   * ファイルを閉じる
   */
  def close() {
    if (buffer != null) {
      writer.print(buffer)
    }
    writer.close()
  }

  /**
   * インデント無し出力
   *
   * @param v: String
   */
  def apply(v: String) {
    if (buffer == null) {
      writer.print(v + "\n")
    } else {
      buffer.append(v + "\n")
    }
  }
}
