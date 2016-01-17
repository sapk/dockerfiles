#A simple client for letsencrypt  certificate generation
# docker run -ti --rm -v /etc/nginx/certs sapk/letsencrypt domain.com
FROM google/golang
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV BASEDIR="/var/certs"

RUN go get -u github.com/mastercactapus/letsencrypt-getcert \
    && rm /go/src/*

VOLUME ${BASEDIR} 
WORKDIR ${BASEDIR}
EXPOSE 80 443
ENTRYPOINT ["/go/bin/letsencrypt-getcert", "generate", "--chain"]
CMD [""]

