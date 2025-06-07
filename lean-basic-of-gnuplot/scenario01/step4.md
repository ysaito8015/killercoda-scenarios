# グラフの装飾とカスタマイズ

## 軸ラベルとタイトルの追加

プロフェッショナルなグラフには、適切なラベルが必要です。

まずリセットして、マラソンデータに戻りましょう：

`reset`{{execute}}

`set terminal png size 800,600`{{execute}}

軸ラベルとタイトルを追加：

`set xlabel "完走時間 [分]"`{{execute}}

`set ylabel "ランナー数 [人]"`{{execute}}

`set title "マラソン大会の完走時間分布"`{{execute}}

`set output 'plots/marathon_labeled.png'`{{execute}}

`plot "data/marathon.dat" using 1:2 with boxes title "2023年大会"`{{execute}}

`unset output`{{execute}}

[ラベル付きグラフを表示]({{TRAFFIC_HOST1_8080}}/plots/marathon_labeled.png)

## グリッドの追加

グラフを読みやすくするため、グリッドを追加します：

`set grid`{{execute}}

`set output 'plots/marathon_grid.png'`{{execute}}

`plot "data/marathon.dat" using 1:2 with boxes title "2023年大会"`{{execute}}

`unset output`{{execute}}

[グリッド付きグラフを表示]({{TRAFFIC_HOST1_8080}}/plots/marathon_grid.png)

## 色とスタイルのカスタマイズ

ボックスの色と幅を調整：

`set output 'plots/marathon_styled.png'`{{execute}}

`set boxwidth 0.9 relative`{{execute}}

`set style fill solid 0.8`{{execute}}

`plot "data/marathon.dat" using 1:2 with boxes lc rgb "dark-green" title "2023年大会"`{{execute}}

`unset output`{{execute}}

[スタイル設定したグラフを表示]({{TRAFFIC_HOST1_8080}}/plots/marathon_styled.png)

## 複数のデータセットの比較

仮想的な前年のデータと比較するプロットを作成：

`set output 'plots/marathon_compare.png'`{{execute}}

`set style data boxes`{{execute}}

`set style fill solid 0.5`{{execute}}

`plot "data/marathon.dat" using 1:2 lc rgb "blue" title "2023年", \
"data/marathon.dat" using 1:($2*0.9) lc rgb "red" title "2022年（仮想）"`{{execute}}

`unset output`{{execute}}

[比較グラフを表示]({{TRAFFIC_HOST1_8080}}/plots/marathon_compare.png)

## DLAクラスターの可視化（ボーナス）

最後に、異なるタイプのプロットを見てみましょう：

`reset`{{execute}}

`set terminal png size 600,600`{{execute}}

`set output 'plots/cluster.png'`{{execute}}

`unset border`{{execute}}

`unset xtics`{{execute}}

`unset ytics`{{execute}}

`unset key`{{execute}}

`set size square`{{execute}}

`plot "data/cluster_sample.dat" using 1:2 with points pt 7 ps 2 lc rgb "black"`{{execute}}

`unset output`{{execute}}

[DLAクラスターを表示]({{TRAFFIC_HOST1_8080}}/plots/cluster.png)

これは科学計算でよく使われる、装飾を最小限にしたプロットスタイルです。

## 高品質な出力例

最後に、出版品質のグラフを作成してみましょう：

`reset`{{execute}}

`set terminal png size 1000,700`{{execute}}

`set output 'plots/publication_quality.png'`{{execute}}

`set title "マラソン大会完走時間分布の分析"`{{execute}}

`set xlabel "完走時間 [分]"`{{execute}}

`set ylabel "ランナー数 [人]"`{{execute}}

`set grid`{{execute}}

`set key top right`{{execute}}

`set style data boxes`{{execute}}

`set style fill solid 0.7`{{execute}}

`set boxwidth 0.8 relative`{{execute}}

`plot [120:450] "data/marathon.dat" using 1:2 lc rgb "#1f77b4" title "実測データ"`{{execute}}

`unset output`{{execute}}

[出版品質のグラフを表示]({{TRAFFIC_HOST1_8080}}/plots/publication_quality.png)

## まとめ

gnuplotでは：
- `set` コマンドでグラフの外観をカスタマイズ
- 軸ラベル、タイトル、凡例で文脈を提供
- 色、線幅、塗りつぶしで視覚的な差別化
- 目的に応じて装飾の量を調整

これらの機能を使いこなすことで、**データの洞察を効果的に伝える**グラフを作成できます。