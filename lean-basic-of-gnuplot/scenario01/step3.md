# データの探索 - 実行時間の予測

## シミュレーション実行時間データ

別の例として、アルゴリズムの実行時間を分析してみましょう。

まず、データを確認します：

`reset`{{execute}}

`set terminal png size 800,600`{{execute}}

`set output 'plots/runtime_linear.png'`{{execute}}

`set xlabel "クラスターサイズ"`{{execute}}

`set ylabel "実行時間 [秒]"`{{execute}}

`set title "シミュレーション実行時間"`{{execute}}

`plot "data/runtime.dat" using 1:2 with lines lw 2 title "実測データ"`{{execute}}

`unset output`{{execute}}

[実行時間データ（線形スケール）]({{TRAFFIC_HOST1_8080}}/plots/runtime_linear.png)

このグラフでは、クラスターサイズが大きくなるにつれて実行時間が急激に増加していることがわかります。

## 対数プロットの活用

このような場合、両対数プロットが有効です：

`set output 'plots/runtime_loglog.png'`{{execute}}

`set logscale`{{execute}}

`set xlabel "クラスターサイズ"`{{execute}}

`set ylabel "実行時間 [秒]"`{{execute}}

`set title "シミュレーション実行時間（両対数プロット）"`{{execute}}

`plot "data/runtime.dat" using 1:2 with points pt 7 ps 1 title "実測データ"`{{execute}}

`unset output`{{execute}}

[実行時間データ（両対数スケール）]({{TRAFFIC_HOST1_8080}}/plots/runtime_loglog.png)

両対数プロットで直線になることから、実行時間がべき乗則に従うことがわかります。

## モデルとの比較

データがべき乗則 T ~ N^k に従うと仮定して、モデルと比較してみましょう：

`set output 'plots/runtime_model.png'`{{execute}}

`set title "実行時間：データとモデルの比較"`{{execute}}

`plot "data/runtime.dat" using 1:2 title "実測データ" with points pt 7 ps 1.5, \
(x/2500)**3 title "モデル: T = (N/2500)^3" with lines lw 2`{{execute}}

`unset output`{{execute}}

[データとモデルの比較]({{TRAFFIC_HOST1_8080}}/plots/runtime_model.png)

モデルがデータとよく一致していることがわかります。

## 予測の実行

このモデルを使って、より大きなクラスターサイズでの実行時間を予測できます：

`set output 'plots/runtime_prediction.png'`{{execute}}

`set title "実行時間の予測"`{{execute}}

`set grid`{{execute}}

`plot [1000:100000][0.1:100000] \
"data/runtime.dat" using 1:2 title "実測データ" with points pt 7 ps 1.5, \
(x/2500)**3 title "モデル予測" with lines lw 2`{{execute}}

`unset output`{{execute}}

[実行時間の予測]({{TRAFFIC_HOST1_8080}}/plots/runtime_prediction.png)

N=100,000では約100,000秒（約28時間）かかることが予測されます。

## ASCIIでの確認

簡単に傾向を確認：

`unset logscale`{{execute}}

`set terminal dumb`{{execute}}

`set logscale`{{execute}}

`plot [1000:50000] "data/runtime.dat" using 1:2`{{execute}}

べき乗則の特徴的な形状が確認できます。

元の設定に戻します：

`set terminal png size 800,600`{{execute}}

`unset logscale`{{execute}}

## グラフィカル分析の威力

このように、グラフィカル分析により：

1. **データの傾向を視覚的に把握** - 急激な増加を確認
2. **適切なモデルを選択** - 両対数プロットでべき乗則を発見
3. **将来の値を予測** - モデルを外挿して予測

することができます。適切なプロット方法（線形 vs 対数）の選択が、データの本質を理解する鍵となります。