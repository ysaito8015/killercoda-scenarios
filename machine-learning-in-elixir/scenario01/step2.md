## 目標: LiveBook の起動
### 準備概要
- livebook の起動 (docker)


### Livebook の起動

```
docker run -p 8080:8080 -p 8081:8081 --pull always ghcr.io/livebook-dev/livebook
```{{execute}}


### オプション
### Erlang のインストール

mise がインストールされていることを確認します。

```
mise --version
```{{execute}}

Erlang をインストールします。

```
mise install erlang@26.2.5
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
