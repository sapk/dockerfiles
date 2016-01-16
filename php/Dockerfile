# A docker file to run php-fpm server behind nginx or other frontend
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    php-fpm php-zip php-gd \
 && rm /var/cache/apk/*

VOLUME /var/www 
WORKDIR /var/www
EXPOSE 9000
ENTRYPOINT ["php-fpm"]
CMD ["-F"]
