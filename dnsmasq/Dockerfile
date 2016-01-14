# A docker file to run dnsmasq as authoritative dns server

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    dnsmasq \
 && chmod +x /start.sh \
 && rm /var/cache/apk/*
 
 
