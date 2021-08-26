---
title: "GKE で StatefulSet を使うときに注意すること"
emoji: "📦" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp", "gke"]
published: false
---

## 概要

GKE のリージョンクラスタにて StatefulSet を新規作成する時、デフォルトではゾーン永続ディスク( Zonal persistent disk )が作成されます

新規作成の時は問題は無いのですが、 node のメンテナンスなどで StatefulSet の Pod がディスクと異なる zone で起動した場合、ディスクをマウント出来ずに起動エラーになります

回避策としては、 `node pool を 1 つの zone に限定する` か、 `使用するディスクをリージョン永続ディスク( Regional persistent disk )を明示的に使用する` がくらいです

```
公式ドキュメント | Provisioning regional persistent disks
https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/regional-pd


公式ドキュメント | Storage options
https://cloud.google.com/compute/docs/disks
```

## 実際にやってみる

`使用するディスクをリージョン永続ディスク( Regional persistent disk )を明示的に使用する` を試してみます

GKE
