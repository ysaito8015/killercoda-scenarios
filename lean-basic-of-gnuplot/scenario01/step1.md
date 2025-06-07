# gnuplotの起動と基本操作

## gnuplotの起動

まず、作業ディレクトリに移動してPython Webサーバーを起動します：

`cd /root/work`{{execute}}

`python3 -m http.server 8080 &`{{execute}}

`gnuplot`{{execute}}

gnuplotが起動すると、対話型のプロンプト `gnuplot>` が表示されます。

## Killercoda環境での出力設定

Killercodaはターミナル環境のため、グラフをWeb経由で表示します。まず出力設定を確認しましょう：

`set terminal`{{execute}}

PNG形式で出力するように設定されています。

## 基本的なプロット（画像出力）

簡単な数学関数をプロットして、Webで表示してみましょう：

`set output 'plots/sin_plot.png'`{{execute}}

`plot sin(x)`{{execute}}

`unset output`{{execute}}

グラフが生成されました！以下のリンクで表示できます：

[正弦波のグラフを表示]({{TRAFFIC_HOST1_8080}}/sin_plot.png)

## 複数の関数をプロット

複数の関数を同時に表示してみましょう：

`set output 'plots/sin_cos_plot.png'`{{execute}}

`plot sin(x) title "sin(x)", cos(x) title "cos(x)"`{{execute}}

`unset output`{{execute}}

[正弦波と余弦波のグラフを表示]({{TRAFFIC_HOST1_8080}}/sin_cos_plot.png)

## ターミナルでの簡易表示（ASCII）

画像を生成せずに、ターミナルで直接確認することもできます：

`set terminal dumb`{{execute}}

`plot sin(x)`{{execute}}

ASCIIアートでグラフが表示されます！

元の設定に戻します：

`set terminal png size 800,600`{{execute}}

## プロットのスタイル変更

線のスタイルを変更してみましょう：

`set output 'plots/style_plot.png'`{{execute}}

`plot sin(x) with lines title "線", cos(x) with points title "点"`{{execute}}

`unset output`{{execute}}

[スタイルの異なるグラフを表示]({{TRAFFIC_HOST1_8080}}/style_plot.png)

## 範囲の指定

x軸の範囲を指定してプロットできます：

`set output 'plots/range_plot.png'`{{execute}}

`plot [-2*pi:2*pi] sin(x) with lines`{{execute}}

`unset output`{{execute}}

[範囲指定したグラフを表示]({{TRAFFIC_HOST1_8080}}/range_plot.png)

## gnuplotの基本コマンド

- `set terminal` - 出力形式の設定
- `set output` - 出力ファイルの指定
- `unset output` - 出力ファイルを閉じる
- `replot` - 前回のプロットを再描画
- `reset` - すべての設定をリセット
- `help` - ヘルプの表示
- `quit` または `exit` - gnuplotを終了

次のステップでは、実際のデータファイルを読み込んでプロットします。