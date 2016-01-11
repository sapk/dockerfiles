# A docker file to run http://www.sagemath.org/
# Inspired from  : - https://github.com/swenson/docker-sage/blob/master/Dockerfile
#                  - https://github.com/gogits/gogs/blob/master/Dockerfile
#                  - https://github.com/sagemath/docker
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV SAGE_VERSION 6.10

# Better use of fonts-extra
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" | tee -a /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add \
    ca-certificates sudo curl \
    tar m4 bzip2 make patch perl-extutils-makemaker@testing python git \
    gcc g++ gfortran libgfortran \
    openssl-dev readline-dev \
    pango-dev cairo-dev \
    fonts-extra@testing ttf-dejavu \
    imagemagick \
 && rm /var/cache/apk/*
#dejavu-sans-fonts dejavu-serif-fonts dejavu-sans-mono-fonts vlgothic-fonts


#TODO 
# - add cheksum control
# - move to a folder more like /app/sage
RUN mkdir /app \
 && curl -Lso /app/sage-${SAGE_VERSION}.tar.gz http://www-ftp.lip6.fr/pub/math/sagemath/src/sage-${SAGE_VERSION}.tar.gz \
 && tar xvf /app/sage-${SAGE_VERSION}.tar.gz \
 && ls && cd sage-${SAGE_VERSION} && make \
 && rm /app/sage-${SAGE_VERSION}.tar.gz

#TODO find wherre file are located
#VOLUME ["/data"]
EXPOSE 8080
ENTRYPOINT ["/app/sage-${SAGE_VERSION}/sage"]
