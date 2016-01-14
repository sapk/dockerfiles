# A docker file to run dnsmasq as authoritative dns server

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    dnsmasq \
 && rm /var/cache/apk/*
 
EXPOSE 53
ENTRYPOINT ["dnsmasq"]
#http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html Maybe use --conf-dir= to set all params
CMD ["-h", "-k", "-q", "--local-ttl=86400", "--auth-server=dns.sapk.fr", "--auth-zone=sapk.fr","--no-resolv", "-A=/www.sapk.fr/37.187.4.165" ]
