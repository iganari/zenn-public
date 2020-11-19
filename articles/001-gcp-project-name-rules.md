---
title: "GCP のプロジェクト命名規則を考える"
emoji: "🔰"
type: "tech"
topics: ["gcp"]
published: false
---

## この記事の流れ

1. GCP プロジェクトについて
1. GCP のリソース階層について
1. `GCP Project name` と `GCP Project id` について
1. おすすめの命名規則
1. 実際にやってみる

## 事前準備

この記事は GCP についての記事になります。

まだ、GCP を未開設の方は下記を参考に開設してみて下さい :)

[GCP を開設し、無料枠を登録するまでの流れ](https://zenn.dev/iganari/articles/000-gcp-free-tier)


## GCP のリソース階層について


[Resource hierarchy | Google Cloud resource hierarchy in complete](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy)

![](https://cloud.google.com/resource-manager/img/cloud-folders-hierarchy.png)

## GCP の Project について

GCP のプロジェクトには以下の制約があります

+ `Project Name` は後から変更が可能
  + `Project Id` は重複が可能
+ `Project Id` は後から変更不可能
  + `Project Id` は(自分の GCP Project 内外問わず)世界中でユニークである必要がある

また、GCP のリソースを表す際は大抵は Project Id が、リソースを一意に指定する Id として使用されます。

したがって、 `Project Id` を決めた上で project を作成する際に `project name` = `project id` のが望ましいと考えます

また、既に削除された `Project Id` であれば再度作成が可能ですが、 GCP Project はシャットダウンを実行した後も30日は保持されるので、その間は重複作成の扱いとなり同じ `Project Id` では作成出来ない


## GCP の Project の命名規則

個人的におすすめだと思う `Project Id` (と `Project Name`)の命名規則

```
{企業識別子}-{サービス識別子}-{環境識別子(3 文字 OR 4 文字)}
```

+ 例① 状態が異なる 3 つの環境が必要な場合
  + example.com 社の `hogehoge` とサービス
  + `本番環境`, `ステージング環境`, `開発環境` はアプリケーションが実際に実行されている GCP Project
```
## 本番環境
example-hogehoge-prd

## ステージング環境
example-hogehoge-stg

## 開発環境
example-hogehoge-dev
```

+ 例② 状態が異なる 2 つの環境と 2 つの環境で共通のデータを取り扱う環境が必要な場合
  + example.com 社の `hogehoge` とサービス
  + `本番環境` と `開発環境` はアプリケーションが実際に実行されている GCP Project
  + `共通環境` は `本番環境` と `開発環境` の両方から参照したいデータを置いていく GCP Project
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




## 参考 URL

[Best practices for enterprise organizations | エンタープライズ企業のベスト プラクティス](https://cloud.google.com/docs/enterprise/best-practices-for-enterprise-organizations?hl=en)

## 終わりに

Have fun !! :)
