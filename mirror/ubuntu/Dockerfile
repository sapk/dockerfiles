# A docker file to run a ubuntu archive mirror
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

# $RSYNCSOURCE The source mirror near you which supports rsync on
# https://launchpad.net/ubuntu/+archivemirrors
# rsync://<iso-country-code>.rsync.archive.ubuntu.com/ubuntu should always work
# $BASEDIR Define where you want the mirror-data to be on your mirror
# Could use in release mode SYNCMODE="releases" with RSYNCSOURCE="rsync://rsync.releases.ubuntu.com/releases" BASEDIR="/var/www/ubuntureleases/"
ENV SYNCMODE="archive" RSYNCSOURCE="rsync://rsync.archive.ubuntu.com/ubuntu" BASEDIR="/var/www/ubuntuarchive/"

COPY start.sh /

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    rsync bash darkhttpd \
 && addgroup -S ubuntu && adduser -S -H -h ${BASEDIR} -G ubuntu ubuntu \
 && mkdir ${BASEDIR} && chown ubuntu:ubuntu ${BASEDIR} \
 && chmod +x /start.sh \
 && rm /var/cache/apk/*
 
USER ubuntu
VOLUME ${BASEDIR} 

EXPOSE 8080
ENTRYPOINT ["/start.sh"]
