#A simple client for letsencrypt  certificate generation
# docker run -ti --rm -v /etc/nginx/certs:/etc/letsencrypt -v /var/www/domain.com:/var/www sapk/letsencrypt certonly --webroot -w /var/www/ -d www.example.com -d example.com
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>


RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    letsencrypt \
 && rm /var/cache/apk/*

VOLUME /etc/letsencrypt/ 
WORKDIR /etc/letsencrypt/
EXPOSE 80 443
ENTRYPOINT ["/usr/bin/letsencrypt"]
CMD [""]

