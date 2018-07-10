#Inspired from https://github.com/cozy/gozy-docker/blob/master/Dockerfile

FROM golang:1.10-alpine3.7 AS build-env

#Build deps
RUN apk --no-cache add git

#Run deps
RUN apk --no-cache add libmaxminddb \
 && /etc/periodic/weekly/libmaxminddb

#Build
RUN go get -v github.com/cozy/cozy-stack

FROM alpine:3.7

#Run deps
RUN apk --no-cache add ca-certificates

#Import geoip deps from build env
COPY --from=build-env /var/lib/libmaxminddb /var/lib/libmaxminddb

#Create cozy user and env
RUN adduser -S -H -h /etc/cozy -s /bin/sh -g "Cozy" cozy \
 && mkdir /usr/local/bin/storage && chown cozy: /usr/local/bin/storage \
 && mkdir /var/log/cozy && chown cozy: /var/log/cozy \
 && mkdir /var/lib/cozy && chown -R cozy: /var/lib/cozy \
 && mkdir /etc/cozy && chown -R cozy: /etc/cozy

#TODO config in place of CMD arg curl -o /etc/cozy/cozy.yaml https://raw.githubusercontent.com/cozy/cozy-stack/master/cozy.example.yaml && \

#Import cozy-stack build
COPY --from=build-env /go/bin/cozy-stack /usr/local/bin/cozy-stack

#Import cozy applications

#Run config
USER cozy
ENTRYPOINT ["/usr/local/bin/cozy-stack"]
CMD ["serve", "--fs-url=file://localhost/var/lib/cozy","--host=0.0.0.0", "--admin-host=0.0.0.0", "--geodb=/var/lib/libmaxminddb/GeoLite2-City.mmdb"]
VOLUME ["/var/lib/cozy"]
EXPOSE 8080 6060

#TODO output logs to /var/log/cozy
