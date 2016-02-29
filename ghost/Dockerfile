FROM node:0.10-slim
MAINTAINER Antoine GIRARD <sapk@sapk.fr>

RUN groupadd ghost && useradd --no-create-home --home-dir /ghost -g ghost ghost

USER ghost
WORKDIR /ghost

VOLUME /ghost/content/data/

EXPOSE 2368
ENTRYPOINT npm install --production && npm start --production
