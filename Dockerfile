FROM node:17-alpine3.14

WORKDIR /usr/app

RUN npm install zenn-cli@latest

ENTRYPOINT ["npx", "zenn", "preview"]
