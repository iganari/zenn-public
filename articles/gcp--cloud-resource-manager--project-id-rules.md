---
title: "Google Cloud のプロジェクトの Project ID の命名規則を考える"
emoji: "🔰"
type: "tech"
topics: ["googlecloud", "iam"]
published: false
---

## この記事の流れ

1. Google Cloud の プロジェクトについて
1. Google Cloud のリソース階層について
1. おすすめの命名規則
1. 実際にやってみる

## 事前準備

この記事は Google Cloud( 以下 GC ) のプロジェクトの **Name** / **ID** / **Number** の命名規則についての記事になります。

まだ、GC を未開設の方は下記を参考に開設してみて下さい :)

[Google Cloud を開設し、初回無料枠に登録するまでの流れ](https://zenn.dev/iganari/articles/000-gcp-free-tier)

## GC のプロジェクトについて

プロジェクトの識別子は以下の　3　つがあります。

+ Project Name
+ Project ID
+ Project Number

上記の識別子は以下の制約があります。

種類 | 全世界で重複 | 作成時に自分で設定 | 後から変更
:--- | :--- | :--- | :---
Project Name | O | O | O
Project ID | X | O | X
Project Number | X | X | X

この中で一番重要となってくるのは `Project ID` です。

Project ID がなぜ重要か要素ごとに見ていきます

### 1. 全世界で重複が出来ない

つまり、Project ID は `全世界でユニークな値` である必要があります。

GC のリソース( 例えば GCE や BQ など )は基本的に特定の GC のプロジェクトに紐づきます。

故に「 XXX の GC のプロジェクトの GCE インスタンス」と絶対的パスのように表現するためには GC のプロジェクトの識別子は `全世界でユニークな値` が必要不可欠になり、Project ID はそれを満たします。

### 2. 作成時に自分で設定が出来る

GC のプロジェクトを作成する際に 1 の「全世界で重複が出来ない」をクリアしていさえすれば、自分で GC のプロジェクトの Project ID を指定することが出来ます。

また、セキュリティをしっかりと意識した場合の GC のプロジェクトは多くなるはずです。

`多くなった GC のプロジェクトを効率良く管理するために、GC のプロジェクトの識別子に命名規則があった方が良く`、Project ID はそれを満たします。

### 3. 後から変更が出来ない

GC のプロジェクトの識別子がコロコロ変わる場合、仮に 1 の「全世界で重複が出来ない」を満たしていても運用上混乱を生じる可能性が非常に高いです。

故に `GC のプロジェクト作成後はプロジェクトの識別子は変更が出来ないほうが良く`、Project ID はそれを満たします。

### 結論

**以上の 3 点の理由から、 GC のプロジェクトの識別子は Project ID が一番重要です**

+ Project Name について
  + 人が見やすくするためだけの識別し。特別な意味合いを持たせると混乱するので ID と一緒にしておくと良い

+ Project Number について
  + ユーザはいつもは見ない。たまに見る。頭の片隅に覚えておく程度で良い

### 注意点

既に削除された `Project ID` であれば再度作成が可能ですが、 GCP プロジェクトはシャットダウンを実行した後も30日は保持されるので、その間は重複作成の扱いとなり同じ `Project ID` では作成出来ません。

## Project ID の命名制限

+ 6～30 文字
+ 英小文字、数字、ハイフンのみ
+ 先頭は英小文字( 数字やハイフンは使えない )
+ 末尾にハイフンは使えない
+ 過去に使用した ID は完全に削除されるまでは使用出来ない
+ `google`, `null`, `undefined` や `ssl` という文字列は使えない

https://cloud.google.com/resource-manager/docs/creating-managing-projects?hl=en#before_you_begin

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
    + `本番環境` と `開発環境` はアプリケーションが実際に実行されている GC のプロジェクト
    + `共通環境` は `本番環境` と `開発環境` の両方から参照したいデータを置いていく GC のプロジェクト
        + 例えば、ログ基盤や(共通で管理しておいて良い)データ、CI/CD 実行環境、モニタリング基盤など。

```
## 本番環境の Project ID
example-hogehoge-prd

## 開発環境の Project ID
example-hogehoge-dev

## 共通環境の Project ID
example-hogehoge-cmn
```

## 実際にやってみる

※ 簡易のため日本語表記でスクリーンショットを取っていますので言語設定によっては表示されている文言が変わります。

+ 自分の GC のプロジェクトにアクセスします

https://console.cloud.google.com/

+ 赤枠の `My First Project` をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/01.png)

+ 表示された画面の右上に `新しいプロジェクト` があるのでクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/02.png)

+ 赤枠がついている `編集` をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/03.png)

+ `Project ID` を入力する項目が出現します

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/04.png)

+ `Project Name` と `Project ID` に同じ値を入力します
  + 例として、Yahoo という会社の Pay-P-Pay というサービスの開発環境(dev)の GC のプロジェクトを作ります
    + あくまで例です(^^:
    
![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/05-1.png)

+ `Project name` と `Project ID` が正しく入力し終わったら、作成をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/05-2.png)

+ GC のプロジェクト 作成のページが無くなるので、再び赤枠の `My First Project` をクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/06.png)

+ 先程作成した GC のプロジェクトが表示されていることを確認出来ました :)
  + 名前の欄からその GC のプロジェクトをクリックします

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/07.png)

+ 先程、 `My First Project` と表示されていた箇所が自分の作成した GC のプロジェクトと同じ(ここの表示は `Project Name`)になっていることが確認出来ます
  + また、 URL にも `Project ID` が入っていることが確認出来ます

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/001-gcp-project-name-rules/08.png)

## 参考 URL

+ さらにベストプラクティスを学びたい人用
  + [Best practices for enterprise organizations | エンタープライズ企業のベスト プラクティス](https://cloud.google.com/docs/enterprise/best-practices-for-enterprise-organizations?hl=en)

## まとめ

GC のプロジェクトの 3 つ識別子の Project ID の重要性を明らかにした上で、Project ID の命名規則の例をまとめました。

これがすべてのケースで正しいとは限りませんが、多くの場合で参考に出来る命名規則だと思っていますので、ぜひ使ってみてくださいね ;)

Have fun !! :)
