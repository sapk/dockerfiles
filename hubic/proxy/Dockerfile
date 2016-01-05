#A container for a simple hubic proxy https://github.com/gierschv/node-hubic-swiftauth to be used with s3ql as swift 
#TO RUN 
#  docker run \
#   -e APP_KEY=api_hubic_TODO \
#   -e APP_SECRET=TODO \
#   -e BASE_URL=TODO \
#   -p 8080:8080 \
#   sapk/hubic-proxy

FROM mhart/alpine-node:base
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

#ENV APP_KEY= APP_SECRET=  BASE_URL=

RUN apk -U --no-progress upgrade && \
    apk -U --force --no-progress add ca-certificates && \
    wget -O /usr/local/share/hubic-swiftauth.js https://raw.githubusercontent.com/gierschv/node-hubic-swiftauth/master/hubic-swiftauth.js && \
    rm /var/cache/apk/*    

CMD node /usr/local/share/hubic-swiftauth.js

EXPOSE 8080

