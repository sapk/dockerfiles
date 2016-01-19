
# A docker file to run Emby
# Inspired from  :  - https://hub.docker.com/r/emby/emby-base/~/dockerfile/
#                   - https://hub.docker.com/r/emby/embyserver/~/dockerfile/
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>


# Base installation
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates sudo curl gnupg tar gzip zip xz bash cpio \
    make autoconf m4 \
    mono mono-dev mono-lang \
    sqlite ffmpeg \
 && rm /var/cache/apk/*

#Instalaltion de ffmeg
#RUN curl -sL http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz -o /tmp/ffmpeg.tar.xz \
# && tar --extract --file=/tmp/ffmpeg.tar.xz --wildcards "*/ffmpeg" --strip-components=1 -C /bin/ \
# && tar --extract --file=/tmp/ffmpeg.tar.xz --wildcards "*/ffprobe" --strip-components=1 -C /bin/ \
#  && rm -rf /tmp/* 

VOLUME [ "/config" ]
EXPOSE 8096 8920 7359/udp 1900/udp

ENTRYPOINT ["/emby-server"]
