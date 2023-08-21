ARG _TAG='20.5-buster'
FROM node:${_TAG}
# https://hub.docker.com/_/node?tab=tags&page=1&name=-alpine

RUN apt update \
    && apt install -y \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o ~/.vimrc https://gist.githubusercontent.com/iganari/a2baec1af976425cc8e21ccd68cf5585/raw/1a16e989c8677b7ce44c9e495e646540c441997b/_vimrc

# WORKDIR /usr/app
# COPY ./zenn/package.json /usr/app/package.json

# https://www.npmjs.com/package/zenn-cli
# RUN npm install zenn-cli@0.1.144
# RUN npm install

# ENTRYPOINT ["npx", "zenn", "preview"]
