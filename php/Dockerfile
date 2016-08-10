# A docker file to run php-fpm server behind nginx or other frontend
FROM alpine:edge 
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

#UID et GID can be set at run time to change in relation with the host 
ENV BASEDIR="/var/www",UID="33",GID="33"

#Install php and deps (+ add testing repo)
RUN  echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk --no-progress upgrade --no-cache\
 && apk --no-progress add --no-cache ca-certificates \
    php-fpm php-cli php-zip php-gd shadow 
    
#Configure
RUN addgroup -S www-data && adduser -S -H -h ${BASEDIR} -G www-data www-data \
 && mkdir ${BASEDIR} && chown www-data:www-data ${BASEDIR} \
 && sed --in-place s/user\ =\ nobody/user\ =\ www-data/g /etc/php/php-fpm.conf \
 && sed --in-place s/group\ =\ nobody/group\ =\ www-data/g /etc/php/php-fpm.conf \
 && sed --in-place s/listen\ =\ 127.0.0.1:9000/listen\ =\ 0.0.0.0:9000/g /etc/php/php-fpm.conf \

VOLUME ${BASEDIR} 
WORKDIR ${BASEDIR}
EXPOSE 9000

ENTRYPOINT /usr/sbin/groupmod -g $GID www-data && /usr/sbin/usermod -u $UID -g $GID www-data && /usr/bin/php-fpm -F -e -i
CMD []
