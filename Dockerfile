ARG _TAG='20.5-buster'
FROM node:${_TAG}
# https://hub.docker.com/_/node?tab=tags&page=1&name=-alpine

# WORKDIR /usr/app
# COPY ./zenn/package.json /usr/app/package.json

# https://www.npmjs.com/package/zenn-cli
# RUN npm install zenn-cli@0.1.144
# RUN npm install

# ENTRYPOINT ["npx", "zenn", "preview"]
