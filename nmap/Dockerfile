FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

# Install nmap + proxychain
RUN apk --no-cache --no-progress add proxychains-ng nmap \
 && rm -rf /var/cache/apk/* \
 && echo "quiet_mode" > /etc/proxychains/proxychains.conf \
 && echo "proxy_dns" > /etc/proxychains/proxychains.conf \
 && echo "[ProxyList]" >> /etc/proxychains/proxychains.conf \
 && echo "socks5 tor 9050" >> /etc/proxychains/proxychains.conf


#CMD ["proxychains", "nmap"]
