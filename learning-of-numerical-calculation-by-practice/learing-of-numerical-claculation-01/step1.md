## 実行環境

このコースは以下の環境で実行されています.

`pwd; whoami; cat /etc/lsb-release`{{execute}}

画面右にあるターミナルで, xyz のインストール準備が進行しています.

コード片の最後にある &#x23CE; マークをクリックするとターミナルでコマンドが実行されます

## GitHub リポジトリの fork

epiRhandbook_jp のリポジトリの自分の GitHub アカウントへ fork します

1. epiRhandbook_jp のリポジトリにアクセスします
    - https://github.com/appliedepi/epiRhandbook_jp/

2. 画像のボタンを押し, 自分のアカウントにリポジトリを fork します 
    - <img src='https://i.gyazo.com/b6c532cc719b0b651625a717b1ba78ad.png'>
    - この操作は, 自分のアカウントに epiRhandbook_jp のリポジトリがまだないことを前提としています
    - すでに fork 済みかつ, 作業が進んでいる場合は, [こちら]()のチュートリアルを参考にしてください
        - fork 済みのリポジトリを削除しても問題ない場合は, 一旦削除いただければと思います

## リポジトリのクローン

先ほど, fork したリポジトリを, ローカルへクローンします

例として, ターミナルタブでの操作を実行します

作業ディレクトリに移動し

`cd /work`{{execute}}

クローンします. {YOUR_ACCOUNT} の箇所を, 自分のアカウント名に書き換えて実行してください

(下記のコード片は, 末尾のアイコンをクリックするとクリップボードにコピーされます)

`git clone git://github.com/{YOUR_ACCOUNT}/epiRhandbook_jp`{{copy}}

`cd /work/epiRhandbook_jp`{{execute}}


