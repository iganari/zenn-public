---
title: "Cloud Run の始めの一歩"
emoji: "🔰" # アイキャッチとして使われる絵文字（1文字だけ）
type: "tech"
topics: ["gcp", "cloudrun"]
published: true
---


## Cloud Run とは

GCP が提供しているサーバレスサービスの一つであり、特徴としては「フルマネージドのサーバーレスプラットフォーム上で、スケーラブルなコンテナ化されたアプリケーションを開発し、デプロイが出来る」とのことです。

[Cloud Run](https://cloud.google.com/run/?hl=en)

また、類似サービスとしては Google App Engine(以下 App Engine) があります。

## Cloud Run を使うメリット

+ マイクロサービスの容易なデプロイ
    + コンテナ化されたマイクロサービスをコマンド一つでデプロイでき、かつサービス毎に固有の構成をいちいち決めてからデプロイするなどの手間は不要である
+ シンプルで統一的なデベロッパー エクスペリエンス
    + 各マイクロサービスは、Cloud Run のデプロイ単位である Docker イメージとして実装される。
+ スケーラブルなサーバーレス実行
    + マネージド Cloud Run にデプロイされるマイクロサービスは、リクエスト数に応じて自動的にスケーリングします。
        + 基盤となっている Kubernetes クラスタの構成や管理は開発者は意識する必要性はありません。
    + マネージド Cloud Run は、リクエストがない場合は 0 にスケーリングし、リソースを使用しません。
+ 任意の言語で書かれたコードのサポート
    + Cloud Run はコンテナをベースとしているので、任意の言語でコードを作成でき、任意のバイナリやフレームワークを使用できます。

とのことであり公式でも書いてありますが、兎にも角にもサーバレスの強みである「マネージドでスケーラブルなサーバレスプラットフォーム」がより表立ったサービスというわけでですね :)

参考

+ [Google Kubernetes Engine or Cloud Run: which should you use?](https://cloud.google.com/blog/products/containers-kubernetes/when-to-use-google-kubernetes-engine-vs-cloud-run-for-containers)(日本語化記事 [GKE と Cloud Run、どう使い分けるべきか](https://cloud.google.com/blog/ja/products/containers-kubernetes/when-to-use-google-kubernetes-engine-vs-cloud-run-for-containers))


しかし、ここまでの情報だと App Engine とさほど違いは無いように思います
では App Engine との違いを見ていきます

### Cloud Run と GAE の違い

デプロイ先に関して

+ Cloud Run
    + アプリは、フルマネージドインフラストラクチャ (「サーバーレス」、従量制、自動スケーリング)、または Google Kubernetes Engine クラスタにデプロイすることを選択できます。 
+ App Engine
    + 常に完全に管理されており、デプロイ先を選ぶことは出来ません。(初めにリージョンを選ぶことは出来ます。)
    + 一方、自動スケーリングはしっかり行われ、基本の設定では App Engine Flex は徐々に 1 に自動スケーリングし、App Engine の第 2 世代は、急速に 0 に自動スケーリングするように設定されています。

実行できるランタイムに関して

+ Cloud Run
    + コンテナで実行できるアプリであればどの言語でも実行可能です。 
+ App Engine
    + App Engine Flex は、あらゆる言語ランタイムのコンテナを実行することが出来ますが、 App Engine の第 2 世代は限られた言語ランタイムを提供します。

リクエストの処理時間に関して

+ Cloud Run
    + `HTTPリクエスト/レスポンス` ワークロードを実行しますが、必ずしもウェブブラウザリクエストではある必要はありません。しかしリクエストの処理に時間がかかる場合があります。 
+ App Engine
    + HTTP Web アプリを実行します。リクエストのタイムアウトは短めです。 App Engine Classic、Standard、および Flex は異なるタイムアウト値が設定されています

カバーする領域に関して

+ Cloud Run
    + ソフトウェア開発者と運用専門家の両方を含むチーム向けに設計されています。
        + これはコンテナイメージを自分で作成出来るなど、よりインフラ部分をカスタマイズ出来る点を表しています。
+ App Engine
    + 開発者向けに設計されています。

出典元

[Where Should I Run My Code? Choosing From 5+ Compute Options (Cloud Next '19)](https://www.youtube.com/watch?v=wzPmgWJ5fpU)

[![Where should I run my stuff? Choosing compute options](http://img.youtube.com/vi/wzPmgWJ5fpU/0.jpg)](http://www.youtube.com/watch?v=wzPmgWJ5fpU "")

つまり、より自由度が高いほうが Cloud Run という理解で良さそうです :)

## Cloud Run を使ってみる

GCPの公式ドキュメントにクイックスタートがあります。実際にやってみましょう。

[Quickstart: Build and Deploy](https://cloud.google.com/run/docs/quickstarts/build-and-deploy?hl=en)

以下、公式の転記になります

+ `helloworld` というディレクトリを作成して、そのディレクトリに移動しましょう

```
mkdir helloworld
cd helloworld
```

+ `main.py` という Python のコードを書きます

```
vim main.py
```
```
import os

from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello_world():
    name = os.environ.get("NAME", "World")
    return "Hello {}!".format(name)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
```

+ 上記の Python のコードを Cloud Run 上で実行するための `Dockerfile` を作成します

```
vim Dockerfile
```
```
FROM python:3.9-slim

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install Flask gunicorn

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
```

+ Dockerfile から作成するコンテナイメージに含める必要が無いファイルを記載する `.dockerignore` を作成します

```
vim .dockerignore
```
```
Dockerfile
README.md
*.pyc
*.pyo
*.pyd
__pycache__
.pytest_cache
```

+ ここまでのファイルの関係は下記のようです

```
# tree -a ../
../
└── helloworld
    ├── .dockerignore
    ├── Dockerfile
    └── main.py
```

ここまで作成したコードと Dockerfile を Cloud Build を通じて、コンテナイメージを作成し、Google Container Registry(以下、GCR) に PUSH します

+ GCP との認証

```
gcloud auth login -q
```

+ 作業簡易のため、環境変数を設定します

```
export _gcp_pj_id='デプロイしたい GCP Project の ID'
export _con_img='コンテナイメージの名前'
```

+ コンテナイメージを作成して、GCR に PUSH します

```
gcloud builds submit --tag gcr.io/${_gcp_pj_id}/${_con_img} --project ${_gcp_pj_id}
```

+ GCR に PUSH したコンテナイメージを使って、Cloud Run 上でアプリを実行します

```
gcloud run deploy my-first-run \
    --image gcr.io/${_gcp_pj_id}/${_con_img} \
    --platform managed \
    --project ${_gcp_pj_id} \
    --region asia-northeast1 \
    --allow-unauthenticated
```
```
### 例

# gcloud run deploy my-first-run \
>     --image gcr.io/${_gcp_pj_id}/${_con_img} \
>     --platform managed \
>     --project ${_gcp_pj_id} \
>     --region asia-northeast1 \
>     --allow-unauthenticated
Deploying container to Cloud Run service [my-first-run] in project [My GCP Project ID] region [asia-northeast1]
✓ Deploying new service... Done.
  ✓ Creating Revision...
  ✓ Routing traffic...
  ✓ Setting IAM Policy...
Done.
Service [my-first-run] revision [my-first-run-00001-tap] has been deployed and is serving 100 percent of traffic.
Service URL: https://my-first-run-jkkqosglnq-an.a.run.app
```

+ ブラウザから確認します

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/002-gcp-first-cloudrun/01.png)

![](https://raw.githubusercontent.com/iganari/zenn-public/main/articles/images/002-gcp-first-cloudrun/02.png)

これで初めての Cloud Run へのアプリのデプロイが完了しました :)

## まとめ

主にこれから Cloud Run を触っていく人向けに Cloud Run の基本的な理解と基本的なデプロイを学びました。

しかし、クイックスタートで学んだ挙動は Cloud Run の一機能に過ぎません。

Cloud Run 自体の機能はもっと多く、かつ日々多くの機能が拡充されていっています。

開発者にとって機能的にもコスト的にもメリットが大きいサービスなので、今からでも積極的に触っていきましょう!!

Have fan !! :)
