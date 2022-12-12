# zenn-public

## Zenn の URL

+ パブリックには下記の URL 先にデプロイされる

https://zenn.dev/iganari

## デプロイ方法

GitHub 連携をしているので、 main branch に merge したタイミングで Zenn にデプロイされる

## ローカルでの記事のプレビューの仕方

+ Docker Compose を起動する

```
docker-compose up -d --build
```

+ Docker Compose を起動後に Web ブラウザで確認する

```
http://0.0.0.0:8080
```

+ Docker Compose の停止および削除する

```
docker-compose stop
docker-compose rm -f
```

## Tips など

### 記事の命名ルール

Zenn にデプロイした場合は、記事の名前が URL になる

元ネタは [Package GCP](https://github.com/iganari/package-gcp) なので、Package GCP でのネストが記事の名前と連動している形にする

### 画像をいれる場合

基本的には [Package GCP](https://github.com/iganari/package-gcp) に格納し、参照させる

上記が間に合わない場合は、この Repository にいれる -> [Zenn | GitHubリポジトリ連携で画像をアップロードする方法](https://zenn.dev/zenn/articles/deploy-github-images)
