ARG _TAG='16-buster'
FROM node:${_TAG}
# https://hub.docker.com/_/node?tab=tags&page=1&name=-alpine

WORKDIR /usr/app

RUN npm install zenn-cli@latest

# ENTRYPOINT ["npx", "zenn", "preview"]
