FROM alpine
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk -U --no-cache --no-progress upgrade \
&& apk -U --no-cache --force --no-progress add wget openssl ca-certificates \
&& wget -O /usr/bin/cachet-monitor https://github.com/CastawayLabs/cachet-monitor/releases/download/v2.0/cachet-monitor_linux_amd64 \
&& chmod +x /usr/bin/cachet-monitor \
&& apk --force remove wget openssl && rm -rf /var/cache/apk/*

ENTRYPOINT /usr/bin/cachet-monitor
