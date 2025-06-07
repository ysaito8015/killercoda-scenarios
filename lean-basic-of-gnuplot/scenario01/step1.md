# gnuplotの起動と基本操作

## gnuplotの起動

まず、作業ディレクトリに移動してgnuplotを起動しましょう：

`cd /root/work`{{execute}}

`gnuplot`{{execute}}

gnuplotが起動すると、対話型のプロンプト `gnuplot>` が表示されます。

## 基本的なプロット

簡単な数学関数をプロットしてみましょう：

`plot sin(x)`{{execute}}

正弦波が表示されましたね！gnuplotは数学関数を直接プロットできます。

複数の関数を同時に表示することもできます：

`plot sin(x), cos(x)`{{execute}}

## プロットのスタイル変更

線のスタイルを変更してみましょう：

`plot sin(x) with lines, cos(x) with points`{{execute}}

- `with lines` - 線でプロット
- `with points` - 点でプロット
- `with linespoints` - 線と点の両方でプロット

## 範囲の指定

x軸の範囲を指定してプロットできます：

`plot [-2*pi:2*pi] sin(x) with lines`{{execute}}

## gnuplotの基本コマンド

- `replot` - 前回のプロットを再描画
- `clear` - 画面をクリア
- `reset` - すべての設定をリセット
- `help` - ヘルプの表示
- `quit` または `exit` - gnuplotを終了

次のステップでは、実際のデータファイルを読み込んでプロットします。