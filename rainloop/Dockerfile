# A docker file to run rainloop
FROM sapk/php-fpm
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV WORKDIR="/var/rainloop" DOWN_URL="http://repository.rainloop.net/v2/webmail/rainloop-community-latest.zip"

RUN apk -U --force --no-progress upgrade \
 && apk -U --force --no-progress add \
    unzip wget \
    php-iconv php-pdo_sqlite php-curl php-json php-dom php-openssl php-zlib pcre \
 && wget -q -O /tmp/rainloop-community-latest.zip "$DOWN_URL" \
 && mkdir "$WORKDIR" && cd "$WORKDIR" && ls /tmp && pwd \
 && unzip -q /tmp/rainloop-community-latest.zip \
 && ls -lah \
 && chown -R www-data:www-data .\
 && find . -type d -exec chmod 755 {} \; \
 && find . -type f -exec chmod 644 {} \; \
 && apk --force --no-progress del unzip wget \
 && rm /var/cache/apk/* /tmp/rainloop-community-latest.zip

EXPOSE 80
WORKDIR $WORKDIR
VOLUME $WORKDIR/data

ENTRYPOINT /usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && /usr/bin/php -S 0.0.0.0:80 -t $WORKDIR
CMD []
