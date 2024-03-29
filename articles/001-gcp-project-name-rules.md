---
title: "GCP のプロジェクト命名規則を考える"
emoji: "🔰"
type: "tech"
topics: ["gcp"]
published: true
---

## この記事の流れ

1. GCP プロジェクトについて
1. GCP のリソース階層について
1. おすすめの命名規則
1. 実際にやってみる

## 事前準備

この記事は GCP についての記事になります。

まだ、GCP を未開設の方は下記を参考に開設してみて下さい :)

[GCP を開設し、初回無料枠に登録するまでの流れ](https://zenn.dev/iganari/articles/000-gcp-free-tier)

## GCP プロジェクトについて

プロジェクトの識別子は以下の3つがあります。

+ Project name
+ Project ID
+ Project number

上記の識別子は以下の制約があります

種類 | 自分で設定 | 後から変更 | 重複
:--- | :--- | :--- | :---
Project name | 可能 | 可能 | 可能
Project ID | 可能 | 不可 | 不可
Project number | 不可 | 不可 | 不可

`Project ID` は自分の GCP プロジェクト内外問わず、世界中でユニークである必要があります。

また、GCP のリソースを表す際は大抵は `Project ID` が、リソースを一意に指定する ID として使用されます。

したがって、 `Project ID` を決めた上で GCP プロジェクトを作成する際に `Project name` = `Project ID` のが望ましいと考えます。

既に削除された `Project ID` であれば再度作成が可能ですが、 GCP プロジェクトはシャットダウンを実行した後も30日は保持されるので、その間は重複作成の扱いとなり同じ `Project ID` では作成出来ません。

## GCP のリソース階層について

WIP

[Resource hierarchy | Google Cloud resource hierarchy in complete](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy)

![](https://cloud.google.com/resource-manager/img/cloud-folders-hierarchy.png)

## Project ID の命名制限

+ 6～30 文字
+ 小文字、数字、ハイフンのみ
+ 先頭は英文字(数字やハイフンは使えない)
+ 末尾にハイフンは使えない
+ 過去に使用した ID も使用できない
+ `google` や `ssl` という文字列は使えない

## おすすめの Project ID の命名規則

個人的におすすめだと思う `Project ID` (と `Project name`)の命名規則を紹介します :)

```
{企業識別子}-{サービス識別子}-{環境識別子(3 文字 OR 4 文字)}
```

+ 例1 状態が異なる 3 つの環境が必要な場合
    + example.com 社の hogehoge とサービス
    + `本番環境`, `ステージング環境`, `開発環境` はアプリケーションが実際に実行されている GCP プロジェクト

```
## 本番環境
example-hogehoge-prd

## ステージング環境
example-hogehoge-stg

## 開発環境
example-hogehoge-dev
```

+ 例2 状態が異なる 2 つの環境と、2 つの環境で共通のデータを取り扱う環境が必要な場合
    + example.com 社の hogehoge というサービス
    + `本番環境` と `開発環境` はアプリケーションが実際に実行されている GCP プロジェクト
    + `共通環境` は `本番環境` と `開発環境` の両方から参照したいデータを置いていく GCP プロジェクト
        + 例えば、ログ基盤や(共通で管理しておいて良い)データ、CI/CD 実行環境、モニタリング基盤など。

```
## 本番環境
example-hogehoge-prd

## 開発環境
example-hogehoge-dev

## 共通環境
example-hogehoge-cmn
```

## 実際にやってみる

※ 簡易のため日本語表記でスクリーンショットを取っていますので言語設定によっては表示されている文言が変わります。

+ 自分の GCP プロジェクトにアクセスします

https://console.cloud.google.com/

+ 赤枠の `My First Project` をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/01.png)

+ 表示された画面の右上に `新しいプロジェクト` があるのでクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/02.png)

+ 赤枠がついている `編集` をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/03.png)

+ `Project ID` を入力する項目が出現します

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/04.png)

+ `Project name` と `Project ID` に同じ値を入力します
  + 例として、Yahoo という会社の PayPay というサービスの開発環境(dev)の GCP Project を作ります
    + あくまで例です(^^:
    
![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/05-1.png)

+ `Project name` と `Project ID` が正しく入力し終わったら、作成をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/05-2.png)

+ GCP Project 作成のページが無くなるので、再び赤枠の `My First Project` をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/06.png)

+ 先程作成した GCP Project が表示されていることを確認出来ました :)
  + 名前の欄からその GCP Project をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/07.png)

+ 先程、 `My First Project` と表示されていた箇所が自分の作成した GCP Project と同じ(ここの表示は `Project name`)になっていることが確認出来ます
  + また、 URL にも `Project ID` が入っていることが確認出来ます

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/08.png)

## 参考 URL

+ さらにベストプラクティスを学びたい人用
  + [Best practices for enterprise organizations | エンタープライズ企業のベスト プラクティス](https://cloud.google.com/docs/enterprise/best-practices-for-enterprise-organizations?hl=en)

## まとめ

GCP Project の命名ルールをまとめました。

これがすべてのケースで正しいとは限りませんが、多くの場合で参考に出来る命名ルールだと思っています。

Have fun !! :)
