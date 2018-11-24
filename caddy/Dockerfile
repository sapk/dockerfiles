# Caddy server base
# A lot inspired by https://github.com/Zenithar/nano-caddy

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV GOPATH="/go" CADDY_TAG="v0.11.1"

RUN    apk -U --no-progress upgrade \
    && apk -U --force --no-progress add \
          build-tools go git ca-certificates \
    && mkdir $GOPATH /srv \
    && go get -tags=$CADDY_TAG github.com/mholt/caddy \
    && mv $GOPATH/bin/caddy /bin \
    && apk del --purge build-tools go git \
    && rm -rf $GOPATH /var/cache/apk/*

EXPOSE 80 443 2015
VOLUME     [ "/srv" ]
ENTRYPOINT [ "/bin/caddy" ]
CMD        [ "-conf=/srv/Caddyfile" ]
