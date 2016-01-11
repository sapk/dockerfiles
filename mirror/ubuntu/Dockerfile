# A docker file to run a ubuntu archive mirror
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV RSYNCSOURCE="rsync://rsync.archive.ubuntu.com/ubuntu" BASEDIR="/var/www/ubuntuarchive/"

COPY start.sh /

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    rsync bash darkhttpd \
 && addgroup -S ubuntu && adduser -S -H -h ${BASEDIR} -G ubuntu ubuntu \
 && mkdir ${BASEDIR} && chown ubuntu:ubuntu ${BASEDIR} \
 && chmod +x /start.sh \
 && rm /var/cache/apk/*
 
USER ubuntu

EXPOSE 8080
ENTRYPOINT ["/start.sh"]
