# Build a minimal distribution container

FROM golang:alpine AS build-env

RUN set -ex \
 && apk add --no-cache make git \
 && go get -u -v github.com/docker/distribution/registry \
 && cd ${GOPATH}/src/github.com/docker/distribution \
 && make PREFIX=${GOPATH} ${GOPATH}/bin/registry

FROM alpine

RUN set -ex \
    && apk add --no-cache ca-certificates apache2-utils

COPY --from=build-env /go/bin/registry /bin/registry
COPY --from=build-env /go/src/github.com/docker/distribution/cmd/registry/config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]
EXPOSE 5000

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/etc/docker/registry/config.yml"]
