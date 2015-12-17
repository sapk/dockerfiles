# A docker file to run CouchDB
# Inspired from  :  - https://github.com/klaemo/docker-couchdb
#                   - https://github.com/klaemo/docker-couchdb-ssl
#                   - https://github.com/frodenas/docker-couchdb
#                   - https://github.com/chris-kobrzak/docker-couchdb
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV COUCHDB_VERSION 1.6.1

# CouchDB installation
RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates sudo curl gpg\
    tar make gcc g++ \
    erlang icu-dev curl-dev\
 && curl -sSL http://apache.openmirror.de/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz -o couchdb.tar.gz \
 && curl -sSL https://www.apache.org/dist/couchdb/source/$COUCHDB_VERSION/apache-couchdb-$COUCHDB_VERSION.tar.gz.asc -o couchdb.tar.gz.asc \
 && curl -sSL https://www.apache.org/dist/couchdb/KEYS -o KEYS \
 && gpg --import KEYS && gpg --verify couchdb.tar.gz.asc \ 
 && mkdir -p /usr/src/couchdb && tar -xzf couchdb.tar.gz -C /usr/src/couchdb --strip-components=1 && rm couchdb.tar.gz couchdb.tar.gz.asc \
 && cd /usr/src/couchdb \
 && ./configure --with-js-lib=/usr/lib \
 && make --quiet \
 && make install \
 && apk --no-progress --force del sudo curl tar make gcc g++ icu-dev curl-dev gpg\
 && rm /var/cache/apk/* && rm -rf /usr/src/couchdb
 
#Missing mozjs
# ./configure --with-js-lib=/usr/lib   --with-js-include=/usr/include/mozjs
#TODO determine if we can remove also erlang

WORKDIR /var/lib/couchdb
VOLUME ["/var/lib/couchdb", "/usr/local/var/log/couchdb", "/usr/local/etc/couchdb"]
EXPOSE 5984

ENTRYPOINT ["/usr/local/bin/couchdb"]
