# LLLongコンパイラ

```
def add(a:int,b:int):int = {
  a + b 
}

def main() {
  print_i(add(1, 2))
}
```

LLLong は、Windows, Linux, osx 対応の静的コンパイラ言語です。


LLLongは{}ブロックで構造を表現した言語です。C言語ファミリーの言語の特徴を抽出した式言語C式をベースの言語とすることでLisp級の強力なマクロをサポート可能な構造です。

byte,short,int,long,float,doubleのプリミティブな型 多次元配列 構造体 関数に対応し、各種制御構文を実装しています。

複雑な型に対応したLLVMを使用したコンパイラを分かりやすく理解する為に作成しました。
C言語と同等の事ができて、Lisp級のマクロを実行する事が出来ます。

簡単な暗黙的型変換や型推論も動きます。

実際に動く、単純な構造はおおいに理解の助けになるはずです。

## ドキュメント

- [チュートリアル](../../wiki/チュートリアル)
- [リファレンスマニュアル](../../wiki/リファレンスマニュアル)
- [コンパイラ概要](../../wiki/コンパイラ概要)
