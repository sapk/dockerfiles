# A docker file to run php-fpm server behind nginx or other frontend with owncloud pre-installed
FROM sapk/php-fpm
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV WORKDIR="/var/owncloud" OC_VERSION="8.2.2"

#Maybe use the direct owncloud package ?
RUN apk -U --force --no-progress upgrade \
 && apk -U --force --no-progress add \
    php-gd php-xmlrpc php-iconv php-zip php-zlib php-json \
    php-bz2 php-curl php-exif php-intl php-mcrypt php-openssl php-dom php-ctype \
    php-pdo_sqlite php-sqlite3 \
 && wget -O /tmp/owncloud.tar.bz2 "https://download.owncloud.org/community/owncloud-$OC_VERSION.tar.bz2" \
 && cd /tmp && tar jxf /tmp/owncloud.tar.bz2 owncloud \
 && mv /tmp/owncloud "$WORKDIR" && cd "$WORKDIR" \
 && ls  -lah \
 && chown -R www-data:www-data . \
 && find . -type d -exec chmod 755 {} \; \
 && find . -type f -exec chmod 644 {} \; \
 && sed --in-place s/upload_max_filesize\ =\ 2M/upload_max_filesize\ =\ 8G/g /etc/php/php.ini \
 && sed --in-place s/post_max_size\ =\ 8M/post_max_size\ =\ 8G/g /etc/php/php.ini \
 && sed --in-place s/max_input_time\ =\ 60/max_input_time\ =\ 3600/g /etc/php/php.ini \
 && sed --in-place s/max_execution_time\ =\ 30/max_execution_time\ =\ 3600/g /etc/php/php.ini \
 && sed --in-place s/output_buffering\ =\ 4096/output_buffering\ =\ 0/g /etc/php/php.ini \
 && sed --in-place s/memory_limit\ =\ 128M/memory_limit\ =\ 1G/g /etc/php/php.ini \
 && rm -Rf /tmp/* /var/cache/apk/*
#Coudl add php-pdo_pgsql php-pdo_mysql \

#EXPOSE 80
WORKDIR $WORKDIR
VOLUME $WORKDIR/data $WORKDIR/config

#ENTRYPOINT /usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && chown -R www-data:www-data . && /usr/bin/php -S 0.0.$
#CMD []

