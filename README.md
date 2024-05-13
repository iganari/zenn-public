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

+ [トラブルシュート] Docker Compose の状態を確認する

```
watch -n1 docker-compose ps zenn-local
```

+ [トラブルシュート] ログの確認

```
docker-compose logs zenn-local
```

+ [トラブルシュート] Docker 単体での起動確認

```
docker run -it -p 8080:8000 zenn-public-zenn-local /bin/bash
```

+ Docker Compose の停止および削除する

```
docker-compose stop
docker-compose rm -f
docker ps -a | grep zenn-public-zenn-local | awk '{print $1}' | xargs docker rm -f
docker rmi zenn-public-zenn-local
```

## Tips など

### zenn-cli を docker compose 内で実施している理由

docker compose 起動時に zenn-cli@latest を実行することで、zenn-cli のバージョン管理が容易になるため

### 記事の新規作成について

+ コンテナにログイン

```
docker exec -it zenn-local /bin/bash
```

+ 記事の新規作成

```
npx zenn new:article
```

---> 自動作成した記事をよしなにリネームする

### 記事の命名ルール

Zenn にデプロイした場合は、記事の名前が URL になる

元ネタは [Package GCP](https://github.com/iganari/package-gcp) なので、Package GCP でのネストが記事の名前と連動している形にする

### 画像をいれる場合

基本的には [Package GCP](https://github.com/iganari/package-gcp) に格納し、参照させる

上記が間に合わない場合は、この Repository にいれる -> [Zenn | GitHubリポジトリ連携で画像をアップロードする方法](https://zenn.dev/zenn/articles/deploy-github-images)

