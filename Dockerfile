ARG _TAG='16-buster'
FROM node:${_TAG}
# https://hub.docker.com/_/node?tab=tags&page=1&name=-alpine

WORKDIR /usr/app

# https://www.npmjs.com/package/zenn-cli
RUN npm install zenn-cli@0.1.110

# ENTRYPOINT ["npx", "zenn", "preview"]
