# A docker file to mount a hubic folder with https://github.com/TurboGit/hubicfuse

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

# hubicfuse installation
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates gcc make fuse-devel curl-devel libxml2-devel \
    openssl-devel json-c-devel file-devel \
 && rm /var/cache/apk/*
