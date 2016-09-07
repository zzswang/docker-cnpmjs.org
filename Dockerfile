FROM node:latest
MAINTAINER zzswang@gmail.com

ENV HOME="/data" \
    NODE_ENV=production

ENV DATA_DIR="${HOME}/.cnpmjs.org"

RUN mkdir -p ${DATA_DIR} \
  && npm install -g --build-from-source --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/mirrors/node --unsafe-perm cnpmjs.org cnpm sqlite3

COPY config.json ${DATA_DIR}/

EXPOSE 7001/tcp 7002/tcp
VOLUME ["${DATA_DIR}"]
WORKDIR ${HOME}
CMD cnpmjs.org start