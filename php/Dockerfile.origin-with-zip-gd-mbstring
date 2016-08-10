#Based on debian/php librairy with just a little modification to choose uid of user
FROM php:7-fpm
MAINTAINER Antoine GIRARD <sapk@sapk.fr>

ENV DEBIAN_FRONTEND noninteractive 

# Install php extensions
RUN buildDeps=" \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        zlib1g-dev \
    " \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install zip gd mbstring

VOLUME /var/www 
WORKDIR /var/www
ENTRYPOINT /usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && php-fpm -F
