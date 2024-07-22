---
title: "ログを見ていたら Amazon らしき Bot がいたので調べてみた"
emoji: "🤖" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["Amazon", "Bot", "Crawler"]
published: true
---

## 概要

とあるアプリケーションのログを見ていたら Amazon のものらしき Bot がいたので、なりすましの疑いも踏まえて調べてみました

## 結論

Alexa 用の情報収集 Bot でした :o


> Amazonbot is Amazon's web crawler used to improve our services, such as enabling Alexa to answer even more questions for customers.

:::details 日本語訳
Amazonbot は、Alexa がお客様のより多くの質問に答えられるようにするなど、サービスの向上に使用される Amazon の Web クローラーです。
:::

https://developer.amazon.com/amazonbot

## 実際のログ

:warning: Google Cloud の Cloud Logging を使っていますが、今回の内容とは関係ありません

![](https://raw.githubusercontent.com/iganari/artifacts/main/amazoncom/amazonbot/2024-amazonbot-01.png)

- 抜粋するとこんな感じでログに出ています

```
xxx-xxx-xxx-xxx.crawl.amazonbot.amazon
```
```
(Amazonbot/0.1; +https://developer.amazon.com/support/amazonbot)
```

## 許可・拒否設定

公式ドキュメントに詳細に　**robots.txt を尊重します** とあるので、自分のアプリケーションの **robots.txt** にて適宜設定しましょう

```
User-agent: Amazonbot             # Amazon's user agent
Disallow: /do-not-crawl/          # disallow this directory

User-agent: *                     # any robot
Disallow: /not-allowed/           # disallow this directory
```

## まとめ

世の中にはさまざまなクローラー Bots がいるので、不審に思ったらまずは調べましょう!!

意外に公式だったりします ;)

Have fun :)
