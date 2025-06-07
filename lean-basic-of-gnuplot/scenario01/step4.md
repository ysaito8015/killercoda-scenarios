# グラフの装飾とカスタマイズ

## 軸ラベルとタイトルの追加

プロフェッショナルなグラフには、適切なラベルが必要です。

まずリセットして、マラソンデータに戻りましょう：

`reset`{{execute}}

軸ラベルを追加：

`set xlabel "完走時間 [分]"`{{execute}}

`set ylabel "ランナー数 [人]"`{{execute}}

`set title "マラソン大会の完走時間分布"`{{execute}}

`plot "data/marathon.dat" using 1:2 with boxes title "2023年大会"`{{execute}}

## グリッドの追加

グラフを読みやすくするため、グリッドを追加します：

`set grid`{{execute}}

`replot`{{execute}}

## 色とスタイルのカスタマイズ

ボックスの色を変更：

`plot "data/marathon.dat" using 1:2 with boxes lc rgb "blue" title "2023年大会"`{{execute}}

線幅を太くする：

`plot "data/marathon.dat" using 1:2 with boxes lw 2 lc rgb "dark-green" title "2023年大会"`{{execute}}

## 複数のデータセットの比較

仮想的な前年のデータと比較するプロットを作成：

`plot "data/marathon.dat" using 1:2 with boxes lc rgb "blue" title "2023年", \
"data/marathon.dat" using 1:($2*0.9) with boxes lc rgb "red" title "2022年（仮想）"`{{execute}}

## DLAクラスターの可視化（ボーナス）

最後に、異なるタイプのプロットを見てみましょう：

`reset`{{execute}}

`unset border`{{execute}}

`unset xtics`{{execute}}

`unset ytics`{{execute}}

`set size square`{{execute}}

`plot "data/cluster_sample.dat" using 1:2 with points pt 7 ps 2`{{execute}}

これは科学計算でよく使われる、装飾を最小限にしたプロットスタイルです。

## まとめ

gnuplotでは：
- `set` コマンドでグラフの外観をカスタマイズ
- 軸ラベル、タイトル、凡例で文脈を提供
- 色、線幅、点の形状で視覚的な差別化
- 目的に応じて装飾の量を調整

これらの機能を使いこなすことで、**データの洞察を効果的に伝える**グラフを作成できます。