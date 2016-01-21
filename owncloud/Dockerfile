# A docker file to run php-fpm server behind nginx or other frontend with owncloud pre-installed
FROM sapk/php-fpm
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV OC_VERSION="8.2.2"

RUN wget -O /tmp/owncloud.tar.bz2 "https://download.owncloud.org/community/owncloud-$OC_VERSION.tar.bz2" \
 && cd /var/www &&  tar --extract --strip-components=1 --file=/tmp/owncloud.tar.bz2 owncloud \
 && rm /tmp/owncloud.tar.bz2


VOLUME /var/www/data
WORKDIR /var/www
EXPOSE 9000
ENTRYPOINT ["php-fpm"]
CMD ["-F"]
