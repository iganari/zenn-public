---
title: "Google Cloud で SSL 証明書の有効期限チェックをノーコードで実装する"
emoji: "🔐" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["GoogleCloud", "cloudmonitoring", "ノーコード", "ssl証明書"]
published: true
---

## 概要

SSL 証明書には有効期限があり、有効期限が切れる前に最新の証明書に入れ替えをしなければいけません
しかし、ついつい有効期限を忘れてしまいがちですよね ;(

今回は Google Cloud で SSL 証明書の有効期限チェックを **ノーコード** で実装したいと思います :)

## 仕組み

Uptime Check + Cloud Monitoring のアラート機能で SSL 証明書の期限を取得し、アラート設定を作ることが出来ます

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-00.png)

https://cloud.google.com/monitoring/alerts/policies-in-json?hl=en

## 設定の作成

### 1. HTTPS の Web サイトを用意する

事前に用意しましょう ;)
基本的にはどこの Web サイトでも OK です

:::details 1. 監視対象の HTTPS の Web サイトを設定しているサイトを用意する

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-01-01.png)
:::

:::details 2. SSL 証明書が有効期限内であることを確認する

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-01-02.png)
:::

- ソースコード
  - https://github.com/iganari/package-html-css
- SSL 証明書
  - https://letsencrypt.org/

### 2. Google Cloud の Cloud Monitoring で Uptime Check を作る

こんな感じ :)

:::details 1. 左上のナビゲーションメニューから [Uptime checks] をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-02-01.png)
:::

:::details 2. よしなに設定をします :)

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-02-02.png)
:::

注意点として、 **SSL Validation** を **Enabled** にします

### 3. Google Cloud の Cloud Monitoring で アラートを作る

ここで先ほど作成した Uptime Check を使います
まずは SSL 証明書の期限が、残り 10 日を下回ったらアラートになるように設定しましょう

:::details 1. 左上のナビゲーションメニューから [Alerting] をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-01.png)

:::

:::details 2. [SELECT A METRIC] をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-02.png)

:::

:::details 3. [Uptime Check URL] >> [Uptime_check] >> [Time util SSL certificate expires] を選択し、 [Apply] をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-03.png)

:::

:::details 4. Add filters と Add secondary data transformation を設定していきます

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-04.png)

:::

:::details 5. Add filters にて、先ほど設定した Uptime Check の ID を設定

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-05.png)

:::

:::details 6. Add secondary data transformation を有効化し、設定をします

設定項目 | 設定値
:- | :- 
Rolling window | **1 day**
Rolling window function | **mean**
Time series aggregation | **mean**
Time series group by | **host**

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-06a.png)

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-06b.png)

:::

:::details 7. 設定を入れたら NEXT をクリック

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-07.png)

:::

:::details 8. Configure alert trigger を設定し、 CREATE POLICY をクリック

設定項目 | 設定値
:- | :- 
Condition Types | Threshold
Alert trigger | Any time series viokates
Threshold position | Below threshold
Threshold value | 10

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-03-08.png)

:::

これで設定は完了です :)
あとはアラートの通知先として Slack やメールを設定しておきましょう

## アラートの検証

### 4. アラートの設定を変更し、強制的にアラートを飛ばしてみる

:::details 1. Configure alert trigger にて Threshold value を 100 に変更

- 10日 -> 100 日

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-04-01.png)

:::

:::details 2. インシデントとして検出されること確認

- 初期状態

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-04-02a.png)

- しばらくして、インシデントとして検出される

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-04-02b.png)

:::

### 5. 通知を確認する

例えば、 Slack に通知を飛ばすように設定しておくと以下のような感じで通知がきます

![](https://raw.githubusercontent.com/iganari/artifacts/main/googlecloud/monitoring/alerting/2024-ssl-expr-check-05.png)


## まとめ

SSL 証明書の有効期限チェックを **ノーコード** で実装することが出来ました :D
Cloud Monitoring は他にもいろいろなツールがありますので、ぜひ触ってみてください ;)

Have fun :)