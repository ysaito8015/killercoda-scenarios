## 目標: LiveBook の起動
### 準備概要
1. Erlang のインストール
2. Elixir のインストール
3. git の設定
4. livebook の起動

### Erlang のインストール

mise がインストールされていることを確認します。

```
mise --version
```{{execute}}

Erlang をインストールします。

```
mise install erlang@latest
```{{execute}}

### Elixir のインストール
Elixir をインストールします。

```
mise install elixir@latest
```{{execute}}

### git の設定

```
git config --global user.name #{{your name}}
git config --global user.email #{{your name}}
```{{copy}}


```
cd /root/work
```{{execute}}

```
git clone https://github.com/livebook-dev/livebook.git
cd ./livebook
```{{execute}}


```
mix deps.get --only prod
MIX_ENV=prod mix phx.server
```{{execute}}
