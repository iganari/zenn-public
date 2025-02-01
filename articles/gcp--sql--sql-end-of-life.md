---
title: "Cloud SQL の延長サポートの追加課金について"
emoji: "💸" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["googlecloud", "cloudsql", "mysql", "postgresql"]
published: false
---

## 結論

- Cloud SQL を古いバージョンを使い続けていると通常料金に加え**追加課金**されます
- Cloud SQL の Database バージョンは定期的にアップデートしていきましょう

## 記事の説明

Google Cloud の Cloud Console にて以下のようなコメントがつくようになりました
注意喚起を込めて簡単にまとめておきます

```
[本文]
Starting Feb 1, 2025, all instances running community end-of-life versions of PostgreSQL and MySQL are under extended support.
These instances will be charged for extended support from May 1, 2025.
Upgrade your instances running end-of-life version before May 1, 2025 to prevent additional charges.

[訳]
2025 年 2 月 1 日より、PostgreSQL および MySQL のコミュニティサポート終了バージョンを実行しているすべてのインスタンスは、延長サポートの対象となります。
これらのインスタンスは、2025 年 5 月 1 日から延長サポートに対して課金されます。
追加料金が発生しないようにするには、2025 年 5 月 1 日までにサポート終了バージョンを実行しているインスタンスをアップグレードしてください。
```

![](https://raw.githubusercontent.com/iganari/artifacts/refs/heads/issues/23/googlecloud/sql/sql-end-of-life/2025-sql-end-of-life-01.png)

## どのバージョンが対象か

⚠️ 2025/02/01 時点の情報です

2025/05/01 から追加課金になる Cloud SQL のバージョン

- MySQL 5.6
- MySQL 5.7
- PostgreSQL 9
- PostgreSQL 10
- PostgreSQL 11
- PostgreSQL 12

上記のバージョンの使っている人は早急にアップデートのスケジュールを練ってください

https://cloud.google.com/sql/docs/mysql/extended-support

https://cloud.google.com/sql/docs/postgres/db-versions#database-version-support

https://cloud.google.com/sql/docs/mysql/db-versions#version-support-policy

## どれくらい追加課金されるの

利用している vCPU の種類 (共有コア、占有コア)および、コア数で追加課金の料金が決まります
例えば、「東京リージョンの vCPU 4 の占有コア(非冗長化)」だと、

**1 時間あたり** $0.091 x 4 = **$0.364 の追加課金**

になります

詳細は以下を参照してください

https://cloud.google.com/sql/pricing#extended-support-pricing

## ネクストアクション

Cloud SQL の Database バージョンは定期的にアップデートしていきましょう ( 'ω' و( و"♪

Enjoy SRE && Have fun :)
