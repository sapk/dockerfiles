# A docker file to run php-fpm server behind nginx or other frontend
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

#UID et GID can be set at run time to change in relation with the host 
ENV BASEDIR="/var/www",UID="33",GID="33"

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates php-fpm php-zip php-gd shadow \
 && addgroup -S www-data && adduser -S -H -h ${BASEDIR} -G www-data www-data \
 && mkdir ${BASEDIR} && chown www-data:www-data ${BASEDIR} \
 && sed s/user\ =\ nobody/user\ =\ www-data/g /etc/php/php-fpm.conf \
 && sed s/group\ =\ nobody/group\ =\ www-data/g /etc/php/php-fpm.conf \
 && sed s/listen\ =\ 127.0.0.1:9000/listen\ =\ 0.0.0.0:9000/g /etc/php/php-fpm.conf \
 && rm /var/cache/apk/*

VOLUME ${BASEDIR} 
WORKDIR ${BASEDIR}
EXPOSE 9000
ENTRYPOINT ["/usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && /usr/bin/php-fpm"]
CMD ["-F -e - i"]
