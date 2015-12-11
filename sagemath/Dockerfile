# A docker file to run http://www.sagemath.org/
FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV SAGE_VERSION 6.7

RUN apk -U --no-progress upgrade \
 && apk -U --no-progress add \
    sudo curl \
    tar m4 bzip2 make patch perl-ExtUtils-MakeMaker python git \
    gcc gcc-c++ gcc-gfortran libgfortran \
    openssl-devel readline-devel \
    pango-devel cairo-devel \
    dejavu-sans-fonts dejavu-serif-fonts dejavu-sans-mono-fonts vlgothic-fonts \
    ImageMagick

#TODO 
# - add cheksum control
# - move to a folder more like /app/sage
RUN mkdir /app \
 && curl -Lso /app/sage-${SAGE_VERSION}.tar http://www-ftp.lip6.fr/pub/math/sagemath/src/sage-${SAGE_VERSION}.tar \
 && tar xvf /app/sage-${SAGE_VERSION}.tar \
 && cd sage-5.12 && make \
 && rm /app/sage-${SAGE_VERSION}.tar

#TODO find wherre file are located
#VOLUME ["/data"]
EXPOSE 8080
ENTRYPOINT ["/app/sage-${SAGE_VERSION}/sage"]
