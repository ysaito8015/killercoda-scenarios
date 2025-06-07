#!/usr/bin/env bash
set -euxo pipefail

# 作業ディレクトリの作成
mkdir -p /root/work/data
cd /root/work

# 必要なパッケージのインストール
apt-get update
apt-get install -y gnuplot apache2

# Webサーバーの設定
systemctl start apache2
mkdir -p /var/www/html/plots
chmod 755 /var/www/html/plots

# gnuplotのデフォルト設定（PNG出力）
cat > /root/.gnuplot << 'EOF'
# デフォルトでPNG出力を使用
set terminal png size 800,600 font "Arial,14"
EOF

# サンプルデータの準備
cat > /root/work/data/marathon.dat << 'EOF'
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
EOF

# シミュレーション実行時間データの準備（抜粋）
cat > /root/work/data/runtime.dat << 'EOF'
# Size  Seconds
1000   0
2000   1
3000   2
4000   5
5000   8
6000   13
7000   19
8000   27
9000   39
10000  52
12000  91
14000  144
16000  217
18000  311
20000  432
25000  840
30000  1534
35000  2540
40000  3799
45000  5332
50000  7083
EOF

# DLAクラスターデータのサンプル（簡略版）
cat > /root/work/data/cluster_sample.dat << 'EOF'
# X Y
0 0
1 0
0 1
-1 0
0 -1
1 1
2 0
0 2
-1 -1
-2 0
EOF

echo "環境のセットアップが完了しました。"
echo "作業ディレクトリ: /root/work"
echo "データディレクトリ: /root/work/data"
echo "Webサーバー: http://localhost/"
echo "グラフ出力先: /var/www/html/plots/"