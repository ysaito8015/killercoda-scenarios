# データの可視化 - マラソンデータの分析

## 🟢 データファイルの確認（シェルコマンド）

まず、作業ディレクトリに移動して、データファイルが存在するか確認しましょう：

`cd /root/work`{{execute}}

`ls -la data/`{{execute}}

もしデータファイルが見つからない場合は、以下のコマンドでサンプルデータを作成します：

`mkdir -p data`{{execute}}

`cat > data/marathon.dat << 'EOF'
# Minutes Runners
135  1
140  2
145  4
150  7
155  11
160  13
165  35
170  29
175  34
180  44
185  35
190  25
195  23
200  15
205  9
210  12
215  13
220  22
225  29
230  40
235  51
240  46
245  85
250  60
255  64
260  82
265  67
270  84
275  73
280  78
285  93
290  73
295  86
300  85
305  63
310  57
315  67
320  53
325  54
330  49
335  38
340  32
345  24
350  33
355  14
360  12
365  14
370  9
375  15
380  7
385  9
390  6
395  4
400  6
405  4
410  5
415  8
420  7
425  1
430  9
435  5
440  1
445  3
EOF`{{execute}}

データファイルの内容を確認：

`head -20 data/marathon.dat`{{execute}}

このデータは：
- 第1列：完走時間（分）
- 第2列：その時間帯に完走したランナー数

を表しています。

---

## 🔵 データのプロット（gnuplotコマンド）

gnuplotを起動してデータをプロットします：

`gnuplot`{{execute}}

まず、PNG出力を設定します：

`set terminal png size 800,600`{{execute}}

`set output 'plots/marathon_full.png'`{{execute}}

`plot "data/marathon.dat" using 1:2 with boxes title "完走者数"`{{execute}}

`unset output`{{execute}}

### データの分析

グラフを見ると、興味深い特徴が見えてきます：

1. **二峰性分布（バイモーダル）** - 2つのピークがある
2. **早いピーク** - 約180分（3時間）付近
3. **遅いピーク** - 約300分（5時間）付近

これは何を意味するでしょうか？

### 平均値の罠

もし平均値（282分）だけを見ていたら、210分頃から準備すれば良いと考えるでしょう。
しかし、実際のデータは：

- **アスリート層** - 早い時間帯に集中
- **一般参加者層** - 遅い時間帯に集中

という2つのグループに分かれています。

### より詳細な分析

範囲を限定して、早い時間帯を詳しく見てみましょう：

`set output 'plots/marathon_zoom.png'`{{execute}}

`set xlabel "完走時間 [分]"`{{execute}}

`set ylabel "ランナー数 [人]"`{{execute}}

`set title "マラソン完走時間分布（120-250分）"`{{execute}}

`plot [120:250] "data/marathon.dat" using 1:2 with boxes lc rgb "blue" title "完走者数"`{{execute}}

`unset output`{{execute}}

### ASCIIでの簡易確認

ターミナルで分布の形を確認することもできます：

`set terminal dumb`{{execute}}

`plot [120:450] "data/marathon.dat" using 1:2 with boxes`{{execute}}

二峰性の分布がASCIIでも確認できますね！

元の設定に戻します：

`set terminal png size 800,600`{{execute}}

gnuplotを終了します：

`quit`{{execute}}

---

## 🟢 グラフの確認（シェルコマンド）

作成したグラフを確認しましょう：

`ls plots/*.png`{{execute}}

Webブラウザで表示できます：

- [マラソンデータの全体像を表示]({{TRAFFIC_HOST1_8080}}/plots/marathon_full.png)
- [早い時間帯の詳細を表示]({{TRAFFIC_HOST1_8080}}/plots/marathon_zoom.png)

---

## 📊 発見のまとめ

このように、**データを可視化することで、数値だけでは見えない重要な情報**を発見できます：

- 平均値だけでは実態を把握できない
- 二峰性分布は異なる2つの集団の存在を示唆
- 適切な準備には分布全体の理解が必要

次のステップでは、別のデータセットを使って予測分析を行います。