FROM node:0.10-slim
MAINTAINER Antoine GIRARD <sapk@sapk.fr>

RUN groupadd ghost && useradd --no-create-home --home-dir /ghost -g ghost ghost

WORKDIR /ghost
#TODO analyze to be more precise
VOLUME /ghost

EXPOSE 2368
ENTRYPOINT usermod -u $UID ghost && npm install --production && npm start --production
