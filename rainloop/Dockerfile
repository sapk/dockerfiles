# A docker file to run rainloop
FROM sapk/php-fpm
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV DOWN_URL="http://repository.rainloop.net/v2/webmail/rainloop-community-latest.zip"

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    unzip wget \
 && wget -O /tmp/rainloop-community-latest.zip "$DOWN_URL" \
 && unzip /tmp/rainloop-community-latest.zip -d /var/www \
 && apk --force --no-progress del unzip wget \
 && rm /var/cache/apk/* /tmp/rainloop-community-latest.zip

#CMD ["/usr/bin/php-fpm","-F","-e","-i"]
CMD ["/usr/bin/php-cli", "-S", "0.0.0.0:80", "-t", "/var/www/"]
