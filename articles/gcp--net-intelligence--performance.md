---
title: "Google Cloud のリージョン間のネットワーク遅延を調べる方法について"
emoji: "🛰️" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["GoogleCloud", "Network"]
published: true
---

## 概要

Google Cloud の各リージョン間のネットワーク遅延を調べる方法を紹介します ;)

## 結論

Cloud Console 上から確認をすることが出来ます :D

![](https://github.com/iganari/artifacts/blob/main/googlecloud/net-intelligence/performance/2024-network-latency-console-demo.gif?raw=true)

## 1. 確認の仕方

Network Intelligence >> Performance Dashboard とページを開きます

:::details 1. Cloud Console を開き、左上の 「Navigation memu」 をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-01.png)
:::

:::details 2. 「NETWORKING」 のグループの中の 「Network Intelligence」 をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-02.png)
:::


:::details 3. 「Network Topology」　 のページが開く

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-03.png)
:::

:::details 4. 左の列から 「Performance Dashboard」　 をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-04.png)
:::

:::details 5. 「Performance Dashboard」 を開いたら 「GOOGLE CLOUD」 のタブををクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-05.png)
:::

:::details 6. Google Cloud の全ての Region に属しいている zone 間のレイテンシーが表示されました

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-06.png)
:::

:::details 7. Google Cloud の全ての Region に属しいている zone 間のレイテンシーのページの全体像

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-07.png)
:::

:::details 8. 「View options」 の 「Google Cloud regions」 の中の 「only selected regions」 を選択

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-08.png)
:::

:::details 9. 特定の Region 間だけの情報を表示することも可能です

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-01-09.png)
:::


## 2. サンプル

⚠ 数値に関しては 2024/04 時点のものです

### 東京 <-> 大阪 (約 8~9 ms)

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-02-01.png)

### 東京 <-> 台湾 (約 38 ms)

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-02-02.png)

### 東京 -> ブラジル・サンパウロ州 (約 254 ms)

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/net-intelligence/performance/2024-network-latency-02-03.png)

## まとめ

リージョン間のネットワーク遅延の確認方法の紹介は以上です

Have fun :)
