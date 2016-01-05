# A docker file to mount a hubic folder with https://github.com/TurboGit/hubicfuse

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

# hubicfuse dep installation
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates gcc g++ make git \
    libssl1.0 json-c-dev file-dev fuse-dev curl-dev libxml2-dev \
 && rm /var/cache/apk/*

# Compilation
RUN git clone --depth 1 https://github.com/TurboGit/hubicfuse.git && cd hubicfuse \
    && ./configure && make && make install \
    && /usr/bin/install -c hubic_token /usr/local/bin/hubic_token \
    && cd .. && rm -rf hubicfuse

CMD hubicfuse /mnt -o noauto_cache,sync_read,allow_other && /bin/sh
