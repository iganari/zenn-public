---
title: "静的サイトホスティングの話"
emoji: "🔰" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp"]
published: false
---

クラウドを使って静的サイトをデプロイしたいと思いたいときがある
静的サイトとはサーバレンダリングをしない構成のweb
一般的には HTML CSS javascript で構成されている


AWS だと S3 を使ったやりかたがある
https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html

Azure だとこれが該当する
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website


GCP だとこれ

[Hosting a static website | 静的ウェブサイトのホスティング](https://cloud.google.com/storage/docs/hosting-static-website)

このzennの記事ではGCPにて静的サイトホスティングする場合のやり方とそのコンポーネントを理解するところを目指します


GCP の場合は一般的には「 LB + オブジェクトストーレージ」という構成になる
一般的には表現したのは、GCSだけでも一般公開出来るが、GCP ProjectIDがURL露見してしまうため、限定的な用途以外での使用は基本的にはお勧めできない

本題

GCP で静的サイトホスティングする場合は LB + GCS になる
LBはこれを使う
GCSはこんな感じAWS でいればS3、AzureであればBlobを想像してもらえれば良い


## 実際にやってみる

以下にチュートリアルを作成してみましたので、試してみて下さい :)

+ [単一の静的ウェブサイトのホスティング](https://github.com/iganari/package-gcp/tree/main/storage/hosting-static-website-single)

![](https://raw.githubusercontent.com/iganari/package-gcp/main/storage/hosting-static-website-single/img/01.png)

+ [複数の静的ウェブサイトのホスティング](https://github.com/iganari/package-gcp/tree/main/storage/hosting-static-website-multi)

![](https://raw.githubusercontent.com/iganari/package-gcp/main/storage/hosting-static-website-multi/img/01.png)



ここでは解説をしていきます

なお、ちゃんとした説明を見たい場合は公式ドキュメントを見ましょ

[External HTTP(S) Load Balancing overview | 外部 HTTP(S) 負荷分散の概要](https://cloud.google.com/load-balancing/docs/https?hl=en)


