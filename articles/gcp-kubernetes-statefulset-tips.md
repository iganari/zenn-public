---
title: "GKE で StatefulSet を使うときに注意すること"
emoji: "📦" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp", "gke"]
published: false
---

## 概要

GKE リージョナルクラスターにて StatefulSet を使う際はリージョナルdisk を明示的に使用しましょう

## 実際にやってみる
