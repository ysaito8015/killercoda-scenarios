# gnuplotの起動と基本操作

## 🟢 準備作業（シェルコマンド）

まず、作業ディレクトリに移動します：

`cd /root/work`{{execute}}

出力用ディレクトリを作成します：

`mkdir -p plots`{{execute}}

Pythonウェブサーバーをバックグラウンドで起動します：

`python3 -m http.server 8080 >/dev/null 2>&1 &`{{execute}}

サーバーが起動したことを確認：

`echo "✅ Webサーバーがポート8080で起動しました"`{{execute}}

---

## 🔵 gnuplotの起動と基本操作

それでは、gnuplotを起動しましょう：

`gnuplot`{{execute}}

gnuplotが起動すると、プロンプトが `gnuplot>` に変わります。

### 出力設定の確認

Killercodaはターミナル環境のため、グラフをPNG画像として出力します。まず利用可能な出力形式を確認しましょう：

`show terminal`{{execute}}

PNG形式で出力するように設定します：

`set terminal png size 800,600`{{execute}}

### 基本的なプロット（画像出力）

簡単な数学関数をプロットしてみましょう：

`set output 'plots/sin_plot.png'`{{execute}}

`plot sin(x)`{{execute}}

`unset output`{{execute}}

グラフが生成されました！

---

## 🟢 生成されたファイルの確認（シェルコマンド）

gnuplotを一旦終了します：

`quit`{{execute}}

生成されたファイルを確認しましょう：

`ls -la plots/`{{execute}}

Webブラウザでグラフを表示できます：

[正弦波のグラフを表示]({{TRAFFIC_HOST1_8080}}/sin_plot.png)

---

## 🔵 複数の関数をプロット（gnuplotコマンド）

gnuplotを再起動して、複数の関数を同時に表示してみましょう：

`gnuplot`{{execute}}

出力設定：

`set terminal png size 800,600`{{execute}}

`set output 'plots/sin_cos_plot.png'`{{execute}}

複数の関数を同時にプロット：

`plot sin(x) title "sin(x)", cos(x) title "cos(x)"`{{execute}}

`unset output`{{execute}}

### ターミナルでの簡易表示（ASCII）

画像を生成せずに、ターミナルで直接確認することもできます：

`set terminal dumb`{{execute}}

`plot sin(x)`{{execute}}

ASCIIアートでグラフが表示されます！

元の設定に戻します：

`set terminal png size 800,600`{{execute}}

### プロットのスタイル変更

線のスタイルを変更してみましょう：

`set output 'plots/style_plot.png'`{{execute}}

`plot sin(x) with lines title "線", cos(x) with points title "点"`{{execute}}

`unset output`{{execute}}

### 範囲の指定

x軸の範囲を指定してプロットできます：

`set output 'plots/range_plot.png'`{{execute}}

`plot [-2*pi:2*pi] sin(x) with lines`{{execute}}

`unset output`{{execute}}

gnuplotを終了します：

`quit`{{execute}}

---

## 🟢 作成したグラフの確認（シェルコマンド）

作成したすべてのグラフを確認しましょう：

`ls plots/*.png`{{execute}}

以下のリンクから各グラフを表示できます：

- [正弦波のグラフ]({{TRAFFIC_HOST1_8080}}/sin_plot.png)
- [正弦波と余弦波]({{TRAFFIC_HOST1_8080}}/sin_cos_plot.png)
- [スタイルの異なるグラフ]({{TRAFFIC_HOST1_8080}}/style_plot.png)
- [範囲指定したグラフ]({{TRAFFIC_HOST1_8080}}/range_plot.png)

---

## 📚 gnuplotの基本コマンドまとめ

### gnuplot内で使用するコマンド
- `set terminal` - 出力形式の設定
- `set output` - 出力ファイルの指定
- `unset output` - 出力ファイルを閉じる
- `plot` - グラフを描画
- `replot` - 前回のプロットを再描画
- `reset` - すべての設定をリセット
- `help` - ヘルプの表示
- `show` - 現在の設定を表示
- `quit` または `exit` - gnuplotを終了

### プロットスタイル
- `with lines` - 線グラフ
- `with points` - 散布図
- `with boxes` - 棒グラフ
- `title "タイトル"` - 凡例のタイトル

次のステップでは、実際のデータファイルを読み込んでプロットします。