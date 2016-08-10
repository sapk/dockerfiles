#Based on debian/php librairy with just a little modification to choose uid of user
FROM php:7-fpm
MAINTAINER Antoine GIRARD <sapk@sapk.fr>

ENV DEBIAN_FRONTEND noninteractive 

VOLUME /var/www 
WORKDIR /var/www
ENTRYPOINT /usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && php-fpm -F
