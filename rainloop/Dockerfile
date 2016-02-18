# A docker file to run rainloop
FROM sapk/php-fpm
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV DOWN_URL="http://repository.rainloop.net/v2/webmail/rainloop-community-latest.zip"

RUN apk -U --force --no-progress upgrade \
 && apk -U --force --no-progress add \
    unzip wget \
    php-iconv php-curl php-json php-dom php-openssl pcre \
 && wget -O /tmp/rainloop-community-latest.zip "$DOWN_URL" \
 && unzip /tmp/rainloop-community-latest.zip -d ${BASEDIR} \
 && cd ${BASEDIR} && chown -R www-data:www-data .\
 && find . -type d -exec chmod 755 {} \; \
 && find . -type f -exec chmod 644 {} \; \
 && apk --force --no-progress del unzip wget \
 && rm /var/cache/apk/* /tmp/rainloop-community-latest.zip

EXPOSE 80
#ENTRYPOINT ["/usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && /usr/bin/php-fpm "]
#CMD [" -F -e -i"]
ENTRYPOINT ["/usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && /usr/bin/php-cli "]
CMD [" -S 0.0.0.0:80 -t /var/www/"]

