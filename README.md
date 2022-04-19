# zenn-public

## Zenn の URL

+ パブリックには下記の URL 先にデプロイされる

https://zenn.dev/iganari

## デプロイ方法

WIP

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
