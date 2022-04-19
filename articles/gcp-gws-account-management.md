---
title: "GC のアカウント運用を考える"
emoji: "📝" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["GoogleCloudPlatform", "iam", "GoogleWorkspace"]
published: false
---

## 概要

Google Cloud Platform ( 以下、 GCP ) のアカウント周りをどのように運用するべきか悩むことはありませんか？

おすすめは Google Workspace ( 以下、 GWS ) と組合わせて管理・運用していくのがいいでしょう

以下で簡単に説明していきます

## 前提知識

この記事を読むに当たって、以下の用語を知っていおいてください

+ [Google Cloud](https://cloud.google.com/)
+ [Google Workspace](https://workspace.google.com/)
+ [Cloud Identity](https://support.google.com/cloudidentity/answer/7319251)
+ [Google Cloud | IAM](https://cloud.google.com/iam/docs/overview)

## イメージ

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/000-gcp-free-tier/02.png)

### 1. アカウント管理は GWS で管理

GCP を運用する際は GCP プロジェクトを複数使うことになります

GCP プロジェクト毎に個人の Google アカウントを Principal として登録するのは大変手間ですし、管理も大変です

こういう時は GWS でグループを作成し、そのグループメールに対して GCP 上の IAM の Role を付与しましょう

グループメールを扱うメリットは、例えば人の配置換えがあった際は GWS のグループにて操作をするだけで、GCP へのアクセス・操作権限を付与・剥奪することが出来ます

そして、なるべく個人の Google アカウントを GCP プロジェクトの IAM に登録しないことをお勧めします

![](https://cloud.google.com/iam/img/iam-overview-basics.svg)

### 2. GWS が難しい場合は Cloud Identity を検討

GWS は 14 日間の無償期間がありますが、それ以降はユーザの人数によって課金されていく方式を取っています

「会社のグループウェアは Microsoft Office 365 を使っているので GWS の導入は難しいけど GCP を使いたい」などの場合は Cloud Identity の導入を検討すると良いでしょう

GWS と Cloud Idenitity の比較は他の方のエントリーを参照してください -> [Google 検索](https://www.google.com/search?q=cloud+identity+google+workspace+%E9%81%95%E3%81%84)

### 3. リソースヒエラルキーを意識する

この記事の範疇からすこし脱しますが、GCP を利用する場合は、組織(organization)を利用することをお勧めします

組織を利用することで、様々な機能が使えるようになります

アカウントの運用周りだと、フォルダ単位で割り当てることが出来るので、複数の GCP プロジェクトに一括適用することが出来ます

## まとめ

これはあくまで、 Google Workspace と Google Cloud 間のアカウントの話でした。

GC はさらに組織(Organaize)を使うことによってリソースを効率的に使用できるので、合わせて設計していきましょう

