---
title: "Cloud Identity について"
emoji: "🏢" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp"]
published: false
---

## この記事の流れ

+ [Cloud Identity とは](#cloud-identity-とは)
+ [Cloud Identity を使うメリット](#cloud-identity-を使うメリット)
+ [実際にやってみる](#実際にやってみる)
    + [1. Cloud Identity の初期設定(前半)](#1.-cloud-identity-の初期設定(前半))
    + [2. Cloud Identity の初期設定(後半)](#2.-cloud-identity-の初期設定(後半))
    + [3. GCP プロジェクトを作成する](#3.-gcp-プロジェクトを作成する)
    + [4. リソース階層におけるフォルダを作成する](#4.-リソース階層におけるフォルダを作成する)
+ [参考ドキュメント](#参考ドキュメント)
+ [まとめ](#まとめ)

## Cloud Identity とは

```
Cloud Identity は IDaaS（Identity as a Service）ソリューションであり、企業向けモバイル管理（EMM）サービスです。
Google Workspace で利用できる ID サービスとエンドポイント管理をスタンドアロン型のサービスとして提供します。
Cloud Identity を利用することで、管理者は Google 管理コンソールからユーザー、アプリ、デバイスを一元管理できます。


[出典] Cloud Identity とは
https://support.google.com/cloudidentity/answer/7319251?hl=ja
```

## Cloud Identity を使うメリット

Cloud Identity は基本的には Google Workspace の機能限定版だと捉えて下さい。

例えば、独自ドメインで Gmail を使いたい場合は Cloud Identity ではなく Google Workspace を使って下さい。

Cloud Identity 上で作成したアカウントを使用することで、ドメイン内のすべてのユーザーを Google 管理コンソールから管理でき、SSO などの共通 ID サービスが提供されます。

また、Cloud Identity には 2 つのエディションがあります。

+ Cloud Identity Free Edition
+ Cloud Identity Premium Edition

詳細は以下の資料を参照して下さい

+ [Cloud Identity の機能とエディションの比較](https://support.google.com/cloudidentity/answer/7431902)
+ [Google Workspace の各エディションの比較](https://support.google.com/a/answer/6043385)

## 実際にやってみる

### 前提条件

+ GCP コンソールにログインできるアカウントを持っている ---> ①
+ 独自ドメインを持っていること ---> ②
    + ドメイン認証を行う必要があるため。

:warning: 情報は 2021 年 2 月現在の情報です

## 1. Cloud Identity の初期設定(前半)

https://console.cloud.google.com/iam-admin/cloudidentity/consumer

### 1-1. ① で GCP コンソールにログインしておき、 `IAM & Admin` >> `Identity & Organization` を遷移し、 `GO TO THE CHECKLIST` をクリック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/01.png)

### 1-2. `Set up your cloud identity, domain, and organization resource` の横の `OPEN` をクリック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/02.png)

### 1-3. 右ペインが出てくる

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/03.png)

### 1-4. 右ペインを下の方に行くと出てくる `SIGN UP CLOUD IDENTITY` をクリック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/04.png)

### 1-5. Cloud Identiry の新規作成ページ

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/05.png)

### 1-6. 組織のビジネス名と従業員の数を選ぶ

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/06.png)

### 1-7. 組織の所在地を選ぶ

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/07.png)

### 1-8. 登録するメールを入力

+ これは今回作成する組織外のメールアドレス

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/08.png)

### 1-9. [最重要] 組織のドメインを入力

① を使用します

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/09.png)

### 1-10. 組織の中で使用するメールアドレスなどのドメインをいれる

組織名と同じにしておく

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/10.png)

### 1-11. 名前を入れます

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/11.png)

### 1-12. 一人目のユーザの作成

```
admin@{ドメイン名}

任意のパスワード
```

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/12.png)

### 1-13. Google へのフィールドバック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/13.png)

### 1-14. reCAPTCHA を通じで bot では無いことを通知

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/14.png)

### 1-15. Cloud Identity アカウントの作成完了

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/15.png)

## 2. Cloud Identity の初期設定(後半)

### 2-1. 登録しているアドレスに Cloud Identity の初期設定完了メールが来る

メールの本文の中にもある https://admin.google.com にアクセスする

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/16.png)

### 2-2. 1-12 にて作成したアカウントでログインする

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/17.png)

### 2-3. SMS を使用した多要素認証を実施する

+ 使用したい(SMS認証が出来る端末の)電話番号いれる

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/18.png)

+ 実際に来た SMS メッセージの例

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/19.png)

### 2-4. Google のサービスを使用する際の同意事項

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/20.png)

### 2-5. Cloud Identity の管理コンソールへログイン完了

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/21.png)

### 2-6. Cloud Identity の所有権の証明を始める

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/22.png)

### 2-7. Cloud Identity の所有権の証明方法の確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/23.png)

### 2-8. 自分のドメインに登録するべき TXT レコードの確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/24.png)

```
dig TXT igarashi-test.tech.cloud-ace.jp +short
```
```
## 例

$ dig TXT igarashi-test.tech.cloud-ace.jp +short
"google-site-verification=WFARlAjRpeY6XCg8cfmGPvVM8y303j2-eatfPs6w8eo"
```

### 2-9. 設定した TXT レコードを Google が確認

+ `ドメインの所有権を証明` をクリック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/25.png)

+ 証明が終わるまで待ちます(後で戻ることも出来るらしいけど、そこまで時間はかからないので待っても良いかも)

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/26.png)

### 2-10. ドメインの所有権を証明出来れば、チェックマークが付くので、 `GCP Cloud Console を設定する` をクリックする

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/27.png)

### 2-11. GCP の利用規約に同意する

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/28.png)

### 2-12. GCP の組織(Organizer) の作成がされる(重要)

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/29.png)

### 2-13. GCP の組織(Organizer) の作成完了

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/30.png)

### 2-14. `リソース管理` を確認する

自分が登録したドメインが組織として作成されているか確認

https://console.cloud.google.com/cloud-resource-manager

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/31.png)

### 2-15. Google Admin を設定する

下記の URL からアクセス

https://admin.google.com/ac/home

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/32.png)

### 2-16. 管理コンソールの確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/33.png)

### 2-17. Cloud Identity 上のユーザの確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/34.png)

## 3. GCP プロジェクトを作成する

### 3-1. GCP コンソールに戻り、 `プロジェクトを作成` をクリック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/35.png)

### 3-2. GCP プロジェクトの作成

+ [参考] GCP プロジェクト命名規則

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/36.png)

### 3-3. GCP プロジェクトの作成完了

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/37.png)

## 4. リソース階層におけるフォルダを作成する

+ [公式ドキュメント] フォルダの作成
    + https://cloud.google.com/resource-manager/docs/creating-managing-folders?hl=ja#console

### 4-1. 組織をクリックし、情報パネルを表示する

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/38.png)

### 4-2. `フォルダの管理者` を自分のアカウントに付与する

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/39.png)

### 4-3. 権限の確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/40.png)

### 4-4. `フォルダを作成` をクリック

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/41.png)

### 4-5. `tech` という名前のフォルダを作成

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/42.png)

### 4-6. フォルダが出来ているか確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/43.png)

### 4-7. フォルダを指定して GCP プロジェクトを作成

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/44.png)

### 4-8. 指定したフォルダの配下に GCP プロジェクトがあることを確認

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/004-gcp-cloud-identity/45.png)

## 参考ドキュメント

+ 公式ドキュメント
    + https://cloud.google.com/identity/docs/setup
    + https://support.google.com/a/answer/7384506?hl=ja
    + https://support.google.com/cloudidentity/answer/7661263?hl=ja
    + https://cloud.google.com/identity?hl=ja
    + https://cloud.google.com/identity/docs?hl=ja
    + https://support.google.com/a/topic/7386474?hl=ja
+ クラウドエース
    + https://www.apps-gcp.com/cloud-identity/

## まとめ

Cloud Identity がどんなものであり、どのように初めるかまでを記事の中で見てきました。

Cloud Identity を使用することで GCP をより効率的に管理出来るようになりますので、是非使ってみて下さい。

良いクラウドライフを!!

Have fun!! :)
