FROM node:0.12-slim
MAINTAINER Antoine GIRARD <sapk@sapk.fr>

RUN useradd --create-home --home-dir /shout --user-group shout \
 && npm install -g shout

VOLUME /shout
WORKDIR /shout

USER shout

EXPOSE 9000

CMD /usr/bin/shout --home /shout --public
