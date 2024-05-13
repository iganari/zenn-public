---
title: "Google Cloud をざっくり紹介 ~GAE編~"
emoji: "🚀" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["GoogleCloud", "GoogleCloudをざっくり紹介"]
published: false
---

## 概要

Google Cloud のことをざっくり紹介していくシリーズです

今回は App Engine です

他のリストは [Google Cloud をざっくり紹介](https://zenn.dev/articles/gcp--zakkuri) を参照してください

## App Engine とは

App Engine は Google Cloud の中で PaaS (Platform as a Service) と呼ばれる部類に属するサービスです

実は Google Cloud が一番初めに出したサービスは GAE だということはあまり知られていないかもしれません

https://googleappengine.blogspot.com/2008/04/introducing-google-app-engine-our-new.html

https://www.youtube.com/watch?v=3Ztr-HhWX1c

https://cloud.google.com/blog/ja/products/gcp/reflecting-on-our-ten-year-app-engine-journey

## App Engine の種類

App Engine は SE (Standard Environment) と FE (Flexible Environment) の 2 つの環境に分かれていて、それぞれ特色が異なります
通常 App Engine の文脈で表現されているのは App Engine SE のほうであり、今日の代表的な PaaS の機能を有しています

- 迷った場合にどちらを選ぶか
  - 代表的な PaaS を使いたい場合
    - App Engine SE
  - 低コストやスケーリングの柔軟さ、運用の効率化を目的とする場合
    - App Engine SE
  - VPC Network 内のリソースに内部的アクセスさせたい場合や独自のライブラリが必須の場合
    - App Engine FE
    - ※ Serverless VPC Access などを利用すれば、App Engine SE でも VPC Network 内のリソースに内部的アクセスすることは可能です
    - ※ Cloud Run の方がより良い選択肢となる場合はほとんどである

https://cloud.google.com/appengine/docs/the-appengine-environments?hl=en

https://cloud.google.com/appengine/docs/standard/connecting-vpc?hl=en

## App Engine の活用事例

最も良く利用されているケースは Web サービスですが、 API をホスティングしたり

https://cloud.google.com/blog/ja/topics/customers/google-app-engine-bandainamcostudios

https://cloud.google.com/blog/ja/topics/customers/google-app-engine-signaltalk

## 公式ドキュメント

https://cloud.google.com/appengine/docs?hl=en

https://cloud.google.com/appengine/docs/standard?hl=en

https://cloud.google.com/appengine/docs/flexible?hl=en

## まとめ

Google Cloud の初めのサービスとして Google Cloud の歴史ととも歩んできた GAE が今でも現役なのってすごいですよね
2008年にGoogleがGAEを発表しました。これがGoogle のクラウドサービスの幕開けでした。

ざっくり紹介は以上です

have fan :)