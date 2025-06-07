# データの可視化 - マラソンデータの分析

## データファイルの確認

まず、マラソンの完走時間データを確認しましょう。gnuplotを一旦終了します：

`quit`{{execute}}

データファイルの内容を表示：

`head -20 data/marathon.dat`{{execute}}

このデータは：
- 第1列：完走時間（分）
- 第2列：その時間帯に完走したランナー数

を表しています。

## データのプロット

gnuplotを再起動してデータをプロットします：

`gnuplot`{{execute}}

まず、PNG出力を設定します：

`set terminal png size 800,600 font "Arial,14"`{{execute}}

`set output '/var/www/html/plots/marathon_full.png'`{{execute}}

`plot "data/marathon.dat" using 1:2 with boxes title "完走者数"`{{execute}}

`unset output`{{execute}}

[マラソンデータの全体像を表示]({{TRAFFIC_HOST1_80}}/plots/marathon_full.png)

## データの分析

グラフを見ると、興味深い特徴が見えてきます：

1. **二峰性分布（バイモーダル）** - 2つのピークがある
2. **早いピーク** - 約180分（3時間）付近
3. **遅いピーク** - 約300分（5時間）付近

これは何を意味するでしょうか？

## 平均値の罠

もし平均値（282分）だけを見ていたら、210分頃から準備すれば良いと考えるでしょう。
しかし、実際のデータは：

- **アスリート層** - 早い時間帯に集中
- **一般参加者層** - 遅い時間帯に集中

という2つのグループに分かれています。

## より詳細な分析

範囲を限定して、早い時間帯を詳しく見てみましょう：

`set output '/var/www/html/plots/marathon_zoom.png'`{{execute}}

`set xlabel "完走時間 [分]"`{{execute}}

`set ylabel "ランナー数 [人]"`{{execute}}

`set title "マラソン完走時間分布（120-250分）"`{{execute}}

`plot [120:250] "data/marathon.dat" using 1:2 with boxes lc rgb "blue" title "完走者数"`{{execute}}

`unset output`{{execute}}

[早い時間帯の詳細を表示]({{TRAFFIC_HOST1_80}}/plots/marathon_zoom.png)

## ASCIIでの簡易確認

ターミナルで分布の形を確認することもできます：

`set terminal dumb`{{execute}}

`plot [120:450] "data/marathon.dat" using 1:2 with boxes`{{execute}}

二峰性の分布がASCIIでも確認できますね！

元の設定に戻します：

`set terminal png size 800,600 font "Arial,14"`{{execute}}

## 発見のまとめ

このように、**データを可視化することで、数値だけでは見えない重要な情報**を発見できます：

- 平均値だけでは実態を把握できない
- 二峰性分布は異なる2つの集団の存在を示唆
- 適切な準備には分布全体の理解が必要

次のステップでは、別のデータセットを使って予測分析を行います。