---
title: "GCP のプロジェクト命名規則を考える"
emoji: "🔰"
type: "tech"
topics: ["gcp"]
published: false
---

GCP の無料枠を使って始める

1. Google アカウントの作成


## GCP のリソース階層について


[Resource hierarchy | Google Cloud resource hierarchy in complete](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy)

![](https://cloud.google.com/resource-manager/img/cloud-folders-hierarchy.png)


[Best practices for enterprise organizations | example hierarchy](https://cloud.google.com/docs/enterprise/best-practices-for-enterprise-organizations?hl=en)

![](https://cloud.google.com/docs/images/best-practices-for-enterprise-organizations.png)

## GCP の Project について

project name は後から変更が可能
project id は後から変更不可能

project id のほうが、リソースを指定する URL にも使われる

つまり、project id 決めた上で project を作成する際に `project name` = `project id` のが
よい

project id は世界中でユニークである必要がある

既に削除された id であれば、再作成が可能

ただし、project idはシャットダウンを実行した後も30日は保持されるので、その間は重複作成の扱いとなり同じ id では作成出来ない


## GCP の Project の命名規則

おすすめ

```
{企業識別子}-{サービス識別子}-{環境識別子(3 文字 OR 4 文字)}
```


## 参考 URL

WIP

## 終わりに

Have fun !! :)
