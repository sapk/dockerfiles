# A docker file to run Transmission
# Inspired from  :  - https://hub.docker.com/r/dperson/transmission/~/dockerfile/ 
#                   - https://hub.docker.com/r/albertdixon/transmission/~/dockerfile/

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk -U --no-progress upgrade && apk add -U --force --no-progress transmission-daemon && rm -rf /var/cache/apk/*

VOLUME ["/var/lib/transmission-daemon"]
EXPOSE 9091 51413/tcp 51413/udp

USER nobody

ENTRYPOINT ["/usr/bin/transmission-daemon", "--logfile", "/dev/stdout"]
