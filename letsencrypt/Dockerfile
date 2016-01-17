#A simple client for letsencrypt  certificate generation
# docker run -ti --rm -v /etc/nginx/certs sapk/letsencrypt domain.com
#letsencrypt certonly --webroot -w /var/www/example/ -d www.example.com -d example.com
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV BASEDIR="/var/certs"

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    letsencrypt \
 && mkdir ${BASEDIR}
 && rm /var/cache/apk/*

VOLUME ${BASEDIR} 
WORKDIR ${BASEDIR}
EXPOSE 80 443
ENTRYPOINT ["letsencrypt"]
CMD [""]

