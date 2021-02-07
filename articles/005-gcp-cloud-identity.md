---
title: "Cloud Identity について"
emoji: "🔰" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp"]
published: false
---

## Cloud Identity とは

WIP

## Cloud Run を使うメリット

以下のメリットがあります

WIP

## Google Workspace との違い

基本的には機能限定版

## 実際にやってみる

## ドキュメント

+ 公式ドキュメント
    + https://cloud.google.com/identity/docs/setup
    + https://support.google.com/a/answer/7384506?hl=ja
    + https://support.google.com/cloudidentity/answer/7661263?hl=ja
    + https://cloud.google.com/identity?hl=ja
    + https://cloud.google.com/identity/docs?hl=ja
    + https://support.google.com/a/topic/7386474?hl=ja
+ クラウドエース
    + https://www.apps-gcp.com/cloud-identity/

# 実際にやってみる

## 前提条件

+ GCP コンソールにログインできるアカウントを持っている ---> ①
+ 独自ドメインを持っていること ---> ②
    + ドメイン認証を行う必要があるので


+ 情報は 2021 年 2 月現在の情報です

## 1. Cloud Identity の初期設定(前半)

https://console.cloud.google.com/iam-admin/cloudidentity/consumer


### 1-0. ① で GCP コンソールにログインしておく

WIP

### 1-1. GCP コンソールから `IAM & Admin` >> `Identity & Organization` を遷移し、 `GO TO THE CHECKLIST` をクリック

まずは ① でGCP コンソールにログインしておく

![](./img/01.png)

### 1-2. `Set up your cloud identity, domain, and organization resource` の横の `OPEN` をクリック

![](./img/02.png)

### 1-3. 右ペインが出てくる

![](./img/03.png)

### 1-4. 右ペインを下の方に行くと `SIGN UP CLOUD IDENTITY` をクリック

![](./img/04.png)

## Cloud Identiry の初期設定

### 1-5. Cloud Identiry の新規作成ページ

![](./img/05.png)

### 1-6. 組織のビジネス名と従業員の数を選ぶ

![](./img/06.png)

### 1-7. 組織の所在地を選ぶ

![](./img/07.png)

### 1-8. 登録するメールを入力

+ これは今回作成する組織外のメールアドレス

![](./img/08.png)

### 1-9. [最重要] 組織のドメインを入力

① を使用します

![](./img/09.png)

### 1-10. 組織の中で使用するメールアドレスなどのドメインをいれる

組織名と同じにしておく

![](./img/10.png)

### 1-11. 名前を入れます

![](./img/11.png)

### 1-12. 一人目のユーザの作成

```
admin@{ドメイン名}

任意のパスワード
```

![](./img/12.png)

### 1-13. Google へのフィールドバック

![](./img/13.png)

### 1-14. reCAPTCHA を通じで bot では無いことを通知

![](./img/14.png)

### 1-15. Cloud Identity アカウントの作成完了

![](./img/15.png)

## 2. Cloud Identity の初期設定(後半)

### 2-1. 登録しているアドレスに Cloud Identity の初期設定完了メールが来る

メールの本文の中にもある https://admin.google.com にアクセスする

![](./img/16.png)


```
WIP
```

### 2-2. 1-12 にて作成したアカウントでログインする

![](./img/17.png)

### 2-3. SMS を使用した多要素認証を実施する

+ 使用したい(SMS認証が出来る端末の)電話番号いれる

![](./img/18.png)

+ 実際に来た SMS メッセージの例

![](./img/19.png)

### 2-4. Google のサービスを使用する際の同意事項

![](./img/20.png)

### 2-5. Cloud Identity の管理コンソールへログイン完了

![](./img/21.png)

### 2-6. Cloud Identity の所有権の証明を始める

![](./img/22.png)

### 2-7. Cloud Identity の所有権の証明方法の確認

![](./img/23.png)

### 2-8. 自分のドメインに登録するべき TXT レコードの確認

![](./img/24.png)

```
dig TXT igarashi-test.tech.cloud-ace.jp +short
```
```
### 例

$ dig TXT igarashi-test.tech.cloud-ace.jp +short
"google-site-verification=WFARlAjRpeY6XCg8cfmGPvVM8y303j2-eatfPs6w8eo"
```

### 2-9. 設定した TXT レコードを Google が確認

+ `ドメインの所有権を証明` をクリック

![](./img/25.png)

+ 証明が終わるまで待ちます(後で戻ることも出来るらしいけど、そこまで時間はかからないので待っても良いかも)

![](./img/26.png)

### 2-10. ドメインの所有権を証明出来れば、チェックマークが付くので、 `GCP Cloud Console を設定する` をクリックする

![](./img/27.png)

### 2-11. GCP の利用規約に同意する

![](./img/28.png)

### 2-12. GCP の組織(Organizer) の作成がされる(重要)

![](./img/29.png)

### 2-13. GCP の組織(Organizer) の作成完了

![](./img/30.png)

### 2-14. `リソース管理` を確認する

自分が登録したドメインが組織として作成されているか確認

https://console.cloud.google.com/cloud-resource-manager

![](./img/31.png)

### 2-15. Google Admin を設定する

下記の URL からアクセス

https://admin.google.com/ac/home

![](./img/32.png)

### 2-16. 管理コンソールの確認

![](./img/33.png)

### 2-17. Cloud Identity 上のユーザの確認

![](./img/34.png)

## 3. GCP プロジェクトを作成する

### 3-1. GCP コンソールに戻り、 `プロジェクトを作成` をクリック

![](./img/35.png)

### 3-2. GCP プロジェクトの作成

+ [参考] GCP プロジェクト命名規則

![](./img/36.png)

### 3-3. GCP プロジェクトの作成完了

![](./img/37.png)

## 4. リソース階層におけるフォルダを作成する

+ [公式ドキュメント] フォルダの作成
    + https://cloud.google.com/resource-manager/docs/creating-managing-folders?hl=ja#console

### 4-1. 組織をクリックし、情報パネルを表示する

![](./img/38.png)

### 4-2. `フォルダの管理者` を自分のアカウントに付与する

![](./img/39.png)

### 4-3. 権限の確認

![](./img/40.png)

### 4-4. `フォルダを作成` をクリック

![](./img/41.png)

### 4-5. `tech` という名前のフォルダを作成

![](./img/42.png)

### 4-6. フォルダが出来ているか確認

![](./img/43.png)

### 4-7. フォルダを指定して GCP プロジェクトを作成

![](./img/44.png)

### 4-8. 指定したフォルダの配下に GCP プロジェクトがあることを確認

![](./img/45.png)

#
