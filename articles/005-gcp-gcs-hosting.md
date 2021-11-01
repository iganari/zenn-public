---
title: "静的サイトホスティングの話"
emoji: "📄" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp"]
published: false
---

## 概要

クラウドを使って静的サイトをデプロイしたいと思いたいときがある
静的サイトとはサーバサイドのスクリプトを有しないファイル構成のwebサイト
一般的には HTML CSS javascript 等で構成されている


AWS だと S3 を使ったやりかたがある
https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html

Azure だとこれが該当する
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website


GCP だとこれ

[Hosting a static website | 静的ウェブサイトのホスティング](https://cloud.google.com/storage/docs/hosting-static-website)

このzennの記事ではGCPにて静的サイトホスティングする場合のやり方とそのコンポーネントを理解するところを目指します



## GCP における静的サイトホスティング

GCP の場合は一般的には「 LB + オブジェクトストーレージ」という構成になる
一般的には表現したのは、GCSだけでも一般公開出来るが GCP ProjectIDがURL露見してしまうため、限定的な用途以外での使用は基本的にはお勧めできない
故に基本的は「 LB + オブジェクトストーレージ」の運用が一般的になります

GCP の LB は用途ごとに種類が分かれていて、今回のように外部公開するためのLBはglobal cloud load balancer = GCLB と言います


## 実際にやってみる

以下にチュートリアルを作成してみましたので、試してみて下さい :)

+ [単一の静的ウェブサイトのホスティング](https://github.com/iganari/package-gcp/tree/main/storage/hosting-static-website-single)

※ 作成出来るもののイメージ

![](https://raw.githubusercontent.com/iganari/package-gcp/main/storage/hosting-static-website-single/img/01.png)

+ [複数の静的ウェブサイトのホスティング](https://github.com/iganari/package-gcp/tree/main/storage/hosting-static-website-multi)

※ 作成出来るもののイメージ

![](https://raw.githubusercontent.com/iganari/package-gcp/main/storage/hosting-static-website-multi/img/01.png)

## 解説

ここでは解説をしていきます

なお、ちゃんとした説明を見たい場合は公式ドキュメントを見ましょう

[External HTTP(S) Load Balancing overview | 外部 HTTP(S) 負荷分散の概要](https://cloud.google.com/load-balancing/docs/https?hl=en)


![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/005-gcp-gcs-hosting/01.png)

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/005-gcp-gcs-hosting/02.png)

### GCP のロードバランサーは複数ある

### 1. Forwarding rules

GCLB を設定する場合、GCLB の中で一番フロントにあたるコンポーネントです。

ここでは、以下のような情報を登録します

+ IP アドレス
  + 例: 34.102.192.124
+ 受け付けるポート
  + 例: 443

また、次にトラフィックを流す `Target Proxy` の指定もするため、`Forwarding rules` の設定は `Target Proxy` を設定した後に行います

### 2. Target Proxy

Forwarding rules から次にトラフィックが流れてくる部分です

HTTPS を設定する場合は、ここが SSL 終端になります。

また、次にトラフィックを流す `URL map` や SSL 証明書として `Google-managed SSL certificates` の指定もするため、`Target Proxy` の設定は `URL map` や `Google-managed SSL certificates` を設定した後に行います


### 3. Google-managed SSL certificates

GCP が取得・管理してくれるドメイン検証(DV)の証明書です
1つの証明書で複数のホスト名をサポートし、証明書を自動更新しれくれるので、更新期限の管理や更新作業を考えなくて良くなります

注意点として、1つの証明書で複数のホスト名をサポートしてくれますが、ワイルドカードとして使うことは出来ません(2021年3月時点)

また、GCP のプロジェクトの中で設置出来るドメインの数の上限があります

1つの証明書で複数のホスト名 = 上限100

https://cloud.google.com/load-balancing/docs/quotas#ssl_certificates


1 つの target proxy にぶら下げることが出来る ssl cert の上限は 15
https://cloud.google.com/load-balancing/docs/quotas#target_pools_and_target_proxies

### 4. URL map