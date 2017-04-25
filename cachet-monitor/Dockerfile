FROM alpine
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV CM_VER="v3.0" CM_BIN="cachet_monitor_linux_amd64" CM_URL="https://github.com/CastawayLabs/cachet-monitor/releases/download"

RUN apk -U --no-cache --no-progress upgrade \
&& apk -U --no-cache --force --no-progress add wget openssl ca-certificates \
&& wget -O /usr/bin/cachet-monitor "$CM_URL/$CM_VER/$CM_BIN" \
&& chmod +x /usr/bin/cachet-monitor \
&& rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/cachet-monitor", "--config", "/etc/cachet-monitor.config.json"]
