# A docker file to run CouchDB
# Inspired from  :  - https://github.com/klaemo/docker-couchdb
#                   - https://github.com/klaemo/docker-couchdb-ssl
#                   - https://github.com/frodenas/docker-couchdb
#                   - https://github.com/chris-kobrzak/docker-couchdb
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV COUCHDB_VERSION="1.6.1" SHELL="/bin/bash"

# CouchDB installation
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates sudo curl gnupg tar gzip zip bash \
    make gcc g++ perl python autoconf m4 \
    erlang erlang-mnesia erlang-public-key erlang-crypto erlang-ssl erlang-sasl erlang-asn1 erlang-inets erlang-os-mon erlang-xmerl erlang-eldap erlang-erts \
    icu-dev curl-dev \
 && wget http://ftp.mozilla.org/pub/mozilla.org/js/mozjs-24.2.0.tar.bz2 \
 && mkdir -p /usr/src/mozjs && tar -xjf mozjs-24.2.0.tar.bz2 -C /usr/src/mozjs --strip-components=1 && rm mozjs-24.2.0.tar.bz2 

RUN cd /usr/src/mozjs/js/src && ./configure && make --quiet && make install && cd
 
RUN curl -sSL http://apache.openmirror.de/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz -o couchdb.tar.gz \
 && curl -sSL https://www.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz.asc -o couchdb.tar.gz.asc \
 && mkdir -p /usr/src/couchdb && tar -xzf couchdb.tar.gz -C /usr/src/couchdb --strip-components=1 && rm couchdb.tar.gz couchdb.tar.gz.asc 

RUN cd /usr/src/couchdb && ./configure --with-js-lib=/usr/local/lib --with-js-include=/usr/local/include/mozjs && make --quiet && make install && cd \
 && apk --no-progress --force del sudo curl tar make gcc g++ icu-dev curl-dev	gnupg \
 && rm /var/cache/apk/* && rm -rf /usr/src/couchdb /usr/src/mozjs
 
#Missing mozjs /usr/local/
#autoconf && mkdir tmp && cd tmp && .
# ./configure --with-js-lib=/usr/lib   --with-js-include=/usr/include/mozjs
#TODO determine if we can remove also erlang
# TODO ADD sign verification 
# && curl -sSL https://www.apache.org/dist/couchdb/KEYS -o KEYS \
# && gpg --import KEYS && gpg --verify couchdb.tar.gz.asc \ 

WORKDIR /usr/local/var/lib/couchdb
VOLUME ["/usr/local/var/lib/couchdb", "/usr/local/var/log/couchdb", "/usr/local/etc/couchdb"]
EXPOSE 5984

ENTRYPOINT ["/usr/local/bin/couchdb"]
