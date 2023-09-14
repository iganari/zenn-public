---
title: "Google Cloud を利用する際の様々な「アカウント」について"
emoji: "📝" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["googlecloud", "gcp"]
published: true
---

## 概要

Google Cloud を扱う上で見ることがある **アカウント** についてまとめてみました :)

最新情報は下記になりますので、合わせてお読みください

https://github.com/iganari/package-gcp/tree/main/_accounts

## 全体

![](https://raw.githubusercontent.com/iganari/package-gcp/main/_accounts/_img/01-all.png)

### サマリー

アカウント | 用途 | 利用者 | 所属( どこに紐づくか )
:- | :- | :- | :- 
[Google Account](#google-account) | Google Cloud のリソースに対してアクション出来るように設定できる | 基本的には人 | Google Admin( in Google Workspace )
[Google Group](#google-group) | 同上 | 同上 | 同上
[Cloud Identity](#cloud-identity) | 同上 | 同上 | 同上
[Service Account](#service-account) | 同上 | プログラムやサーバーなどの特定の人を介さないもの | Google Cloud の特定の Project
[Billing Account](#billing-account) | Google Cloud の課金について制御するように設定できる | 基本的には人 | Google Cloud の組織( Organization )

## Google Account

![](https://raw.githubusercontent.com/iganari/package-gcp/main/_accounts/_img/02-google-account.png)

- 概要
  - Google のサービスを利用する際に必要になるアカウント
  - Google Workspace および Cloud Identity Free/Premium にて、自分のドメインの Google アカウントを発行できる
    - 上記以外だと `@gmail.com` になる
  - 別で作成したアカウント( 例えば Yahoo 等 )を元にした Google Account を作成することも可能
- 作成および管理方法
  - Google Admin にてアカウント作成および管理が可能
- 参考リンク
  - https://www.google.com/account/about/

## Google Group

![](https://raw.githubusercontent.com/iganari/package-gcp/main/_accounts/_img/03-google-group.png)

- 概要
  - 複数の Google アカウントを束ねるグループ
  - グループ固有のメールアドレスもグループ作成と同時に発行されるので、メーリングリストとしても利用可能
  - 基本的には同じドメインの Google アカウントのグループを作るが、別ドメインの Google アカウントを同一のグループに入れることも可能
- 作成および管理方法
  - Google Admin にてグループの作成および管理が可能
- 参考リンク
  - TBD

## Cloud Identity

![](https://raw.githubusercontent.com/iganari/package-gcp/main/_accounts/_img/04-cloud-identity.png)

- 概要
  - 同じドメインのアカウント全体を指すグループ
- 作成および管理方法
  - Google Workspace もしくは Cloud Identity Free/Premium を作成すると同時に利用可能になる
- 参考リンク
  - https://cloud.google.com/identity?hl=en

## Service Account

![](https://raw.githubusercontent.com/iganari/package-gcp/main/_accounts/_img/05-service-account.png)

- 概要
  - プログラムおよびサーバ、特定の Google Cloud のサービスが使用するアカウント
  - 基本的には人は使わない
  - Google Cloud が事前に定義している Service Account もあるので、自分が作った Service Account と適宜使い分ける
- 作成および管理方法
  - Google Cloud の特定の Project 内で作成および管理が可能
- 参考リンク
  - https://cloud.google.com/iam/docs/service-account-overview?hl=en

## Billing Account

![](https://raw.githubusercontent.com/iganari/package-gcp/main/_accounts/_img/06-billing-account.png)

- 概要
  - Google Cloud Project で発生した課金の請求先を決めるもの
  - Google Cloud の組織内で複数発行可能
  - 複数の Google Cloud Project に対して紐付けが可能だが、 Google Cloud Project から見ると同時に紐づけられるのは 1 つ
  - 1 つの Billing Account が紐付け可能な Google Cloud Project の数の初期値が決まっている
    - https://support.google.com/cloud/answer/6330231
- 作成および管理方法
  - https://cloud.google.com/billing/docs/concepts?hl=en
- 参考リンク
  - Billing Account の紐づけ条件を引き上げるリクエストを送るページ
    - https://support.google.com/code/contact/billing_quota_increase

