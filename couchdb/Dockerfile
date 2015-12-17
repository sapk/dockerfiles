# A docker file to run CouchDB
# Inspired from  :  - https://github.com/klaemo/docker-couchdb
#                   - https://github.com/klaemo/docker-couchdb-ssl
#                   - https://github.com/frodenas/docker-couchdb
#                   - https://github.com/chris-kobrzak/docker-couchdb
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV COUCHDB_VERSION 1.6.1

# CouchDB installation
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates sudo curl gnupg tar gzip \
    make gcc g++ perl python autoconf\
    erlang erlang-mnesia erlang-public-key erlang-crypto erlang-ssl erlang-sasl erlang-asn1 erlang-inets erlang-os-mon erlang-xmerl erlang-eldap \
    icu-dev curl-dev \
 && wget http://ftp.mozilla.org/pub/js/js185-1.0.0.tar.gz \
 && mkdir -p /usr/src/mozjs && tar -xzf js185-1.0.0.tar.gz -C /usr/src/mozjs && rm js185-1.0.0.tar.gz \
 && cd /usr/src/mozjs/js-1.8.5/js/src && autoconf && mkdir tmp && cd tmp && ../configure && make --quiet && make install && cd \
 && curl -sSL http://apache.openmirror.de/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz -o couchdb.tar.gz \
 && curl -sSL https://www.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz.asc -o couchdb.tar.gz.asc \
 && mkdir -p /usr/src/couchdb && tar -xzf couchdb.tar.gz -C /usr/src/couchdb --strip-components=1 && rm couchdb.tar.gz couchdb.tar.gz.asc \
 && cd /usr/src/couchdb ./configure --with-js-lib=/usr/lib && make --quiet && make install && cd \
 && apk --no-progress --force del sudo curl tar make gcc g++ icu-dev curl-dev	gnupg \
 && rm /var/cache/apk/* && rm -rf /usr/src/couchdb /usr/src/mozjs
 
#Missing mozjs /usr/local/
# ./configure --with-js-lib=/usr/lib   --with-js-include=/usr/include/mozjs
#TODO determine if we can remove also erlang
# TODO ADD sign verification 
# && curl -sSL https://www.apache.org/dist/couchdb/KEYS -o KEYS \
# && gpg --import KEYS && gpg --verify couchdb.tar.gz.asc \ 

WORKDIR /usr/local/var/lib/couchdb
VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb", "/usr/local/etc/couchdb"]
EXPOSE 5984

ENTRYPOINT ["/usr/local/bin/couchdb"]
