---
title: "Google Cloud をざっくり紹介 ~App Engine 編~"
emoji: "🚀" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["GoogleCloud", "GoogleCloudをざっくり紹介", "AppEngine"]
published: true
---

## 概要

Google Cloud のことをざっくり紹介していくシリーズです

今回は App Engine です

![](https://raw.githubusercontent.com/iganari/package-gcp/main/appengine/_img/main.png)

https://cloud.google.com/appengine/docs?hl=en

他のリストは [Google Cloud をざっくり紹介](https://zenn.dev/articles/gcp--zakkuri) を参照してください

## App Engine とは

App Engine は Google Cloud の中で PaaS (Platform as a Service) と呼ばれる部類に属するサービスです

実は Google Cloud が一番初めに出したサービスは App Engine だということはあまり知られていないかもしれません

https://www.youtube.com/watch?v=3Ztr-HhWX1c

- [Google App Engine Blog | 2008/04/07 Introducing Google App Engine + our new blog](https://googleappengine.blogspot.com/2008/04/introducing-google-app-engine-our-new.html)
- [Google Cloud ブログ | 誕生から 10 年、App Engine の歩みを振り返って](https://cloud.google.com/blog/ja/products/gcp/reflecting-on-our-ten-year-app-engine-journey)

## App Engine の種類

App Engine は [SE (Standard Environment)](https://cloud.google.com/appengine/docs/standard?hl=en) と [FE (Flexible Environment)](https://cloud.google.com/appengine/docs/flexible?hl=en) の 2 つの環境に分かれていて、それぞれ特色が異なります
通常 App Engine の文脈で表現されているのは App Engine SE の事であり、今日の代表的な PaaS の機能を有しています

### 迷った場合にどちらを選ぶか

- 代表的な PaaS を使いたい場合
  - App Engine SE
- 低コストやスケーリングの柔軟さ、運用の効率化を目的とする場合
  - App Engine SE
- VPC Network 内のリソースに内部的アクセスさせたい場合や独自のライブラリが必須の場合
  - App Engine FE
  - ※ Serverless VPC Access などを利用すれば、App Engine SE でも VPC Network 内のリソースに内部的アクセスすることが可能です
  - ※ Cloud Run の方がより良い選択肢となる場合はほとんどがです

https://cloud.google.com/appengine/docs/the-appengine-environments?hl=en

https://cloud.google.com/appengine/docs/standard/connecting-vpc?hl=en

## App Engine の活用事例

最も良く利用されているケースは Web サービスですが、 API をホスティングしたりすることも出来ます

https://cloud.google.com/blog/ja/topics/customers/google-app-engine-bandainamcostudios

https://cloud.google.com/blog/ja/topics/customers/google-app-engine-signaltalk

## その他、参考になるドキュメント

- TBD

## まとめ

Google Cloud の初めのサービスとして Google Cloud の歴史ととも歩んできた App Engine が今でも現役なのってよく良く考えたらすごいですよね :D

ざっくり紹介は以上です

Have fun :)
