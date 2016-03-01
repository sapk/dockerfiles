# A docker file to run Nginx
# Inspired from  :  - https://github.com/oren/alpine-nginx
#                   - https://github.com/nginxinc/docker-nginx

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk -U --no-progress upgrade && apk add -U --force --no-progress nginx && rm -rf /var/cache/apk/*

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]
