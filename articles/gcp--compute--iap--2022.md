---
title: "IAP を利用した GCE にセキュアにログインする方法まとめ 2022 年版"
emoji: "🏢" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp"]
published: false
---

## この記事の流れ

## 注意点

※1 2022/12 時点の情報です

※2 この記事の元ネタはこちらです

https://github.com/iganari/package-gcp

## 概要

Google Cloud の Compute Engine( GCE )では、OS に限らず多くの場合において、外部 IP アドレスを常態的につけることは非推奨となります
以下のページにて、外部 IP アドレスを持たない GCE Instance へのセキュアなログイン方法である Identity-Aware Proxy( IAP )をまとめます
また、この記事は `SSH や RDP などのサーバの中にログインする方法のまとめ` であり、 `Web サーバなどを公開する方法では無い` ので注意してください

## イメージ図

![](https://raw.githubusercontent.com/iganari/package-gcp/main/compute/iap/img/main.png)

## 利用するサービスおよびツール

### 1. IAP for TCP forwarding

パブリックなインターネットからバックエンドの GCE Instance へ SSH や RDP ログインする時に、セキュアな通信経路に加え、IAM の認証・認可でアクセスの可否を制御することが出来ます

https://cloud.google.com/iap/docs/tcp-forwarding-overview

https://cloud.google.com/iap/docs/using-tcp-forwarding

### 2. IAP Desktop

GCE Instance に接続出来る Remote Desktop および SSH クライアント( OSS )

https://github.com/GoogleCloudPlatform/iap-desktop/

## 準備

外部 IP アドレスを持たない GCE Instance およびネットワークの作成は、以下のページを参考に作成してみてください

https://github.com/iganari/package-gcp/tree/main/compute/iap


## CLI が得意な方 😊

### to Linux サーバ

gcloud コマンドで SSH ログインする際に `--tunnel-through-iap` をつけます

そうすると IAP for TCP forwarding を用いた SSH ログインをすることが出来ます

※ オプションを明示的に付けなくてもよしなに判断して IAP for TCP forwarding 経由でアクセスしてくれます 

```
gcloud beta compute ssh {{ Your Google Account Name }}@{{ VM Name }} \
  --tunnel-through-iap \
  --zone {{ VM Xone }} \
  --project { Your GCP Project ID }
```
```
### 例

$ gcloud beta compute ssh {{ Your Google Account Name }}@{{ VM Name }} \
  --tunnel-through-iap \
  --zone {{ VM Xone }} \
  --project { Your GCP Project ID }

Welcome to Ubuntu 22.04.1 LTS (GNU/Linux 5.15.0-1025-gcp x86_64)
Last login: Fri Dec  2 23:30:07 2022 from 35.235.242.49

iganari@iap-test-linux:~$
```

### to Windows サーバ

+ gcloud コマンドで TCP tunnel を作ります
  + 例) GCE Instance の 3389 ポートと localhost の 13389 を繋ぐコマンドです

```
gcloud beta compute start-iap-tunnel {{ VM Name }} 3389 \
  --local-host-port=localhost:13389 \
  --zone {{ VM Xone }} \
  --project ${_gcp_pj_id}
```
```
### 例
$ gcloud beta compute start-iap-tunnel {{ VM Name }} 3389 \
  --local-host-port=localhost:13389 \
  --zone {{ VM Xone }} \
  --project ${_gcp_pj_id}

Testing if tunnel connection works.
Listening on port [13389].


... ( ターミナルはそのままにしておきます)
```

+ Microsoft Remote Desktop から RDP 接続をします

![](https://raw.githubusercontent.com/iganari/package-gcp/main/compute/iap/img/win-01.png)

![](https://raw.githubusercontent.com/iganari/package-gcp/main/compute/iap/img/win-02.png)

![](https://raw.githubusercontent.com/iganari/package-gcp/main/compute/iap/img/win-03.png)



## CLI が苦手な方 🥺

### to Linux サーバ

IAP Desktop を使って SSH ログインしましょう

[IAP Desktop](https://github.com/GoogleCloudPlatform/iap-desktop/) をインストールし、 SSH セッション機能を使いましょう

![](https://raw.githubusercontent.com/GoogleCloudPlatform/iap-desktop/master/doc/images/SSH_350.gif)



### to Windows サーバ

IAP Desktop を使って RDP ログインしましょう

[IAP Desktop](https://github.com/GoogleCloudPlatform/iap-desktop/) をインストールし、 Remote Desktop セッション機能を使いましょう

![](https://raw.githubusercontent.com/GoogleCloudPlatform/iap-desktop/master/doc/images/RemoteDesktop_350.gif)

## 例外について

多くの場合において GCE に 外部 IP アドレスをつけることは非推奨となりますが、例外パターンも存在します
しかしセキュリティリスクに繋がるのと Google Cloud の思想を鑑みると、 IAP を用いた接続方法に徐々にシフトしていくのが正しい姿勢だと個人的に思います

参考までに IAP 以外の経路を確保しておきたい場合のソリューションのイメージ図を貼っておきます

![](/images/gcp--compute--iap--2022/x-99.png)


## まとめ

外部 IP アドレスを持たない GCE Instance へのセキュアなログインをまとめました( 2022/12 時点 )
ぜひ使ってみてくださいね :wink: