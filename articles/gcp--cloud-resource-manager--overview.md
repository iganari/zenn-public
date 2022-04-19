---
title: "リソース階層 について"
emoji: "🔰" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp"]
published: false
---



公式 Doc

https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy?hl=en


# 要約

GCP にはリソース階層というものがある

これは GCP Project をツリー構造上に作れるもの

公式のドキュメントのイメージはこう

IMG

実際にはこう

IMG

組織の権限があれば以下のURLで見ることが出来る
https://console.cloud.google.com/cloud-resource-manager

詳しくは公式ドキュメントを見て欲しい

ここではメリットを挙げていく

+ GCP Workspace と連携することが出来る
    + GCP workspace を作れば GCP の組織も作成される
+ フォルダ対しての権限を付与すれば、その配下のフォルダないし、プロジェクトにも権限が引き継がれる

## 実際に作ってみる

### 組織を作成

WIP

### フォルダを作成

WIP

### フォルダ全体に権限をもつようにユーザに権限を付与

WIP

権限を付与し、確認するまで。

## まとめ

GCP を使う際にはリソース階層をしっかり設計しましょう :)
