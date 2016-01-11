# A docker file to run Java apps (JRE)
# Inspired from  :  - https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/
#                   - https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/
#                   - https://hub.docker.com/r/nate9/minimaljava8

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

# JAVA 8 installation
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --force --no-progress add openjdk8-jre-base@community \
 && rm -rf /var/cache/apk/*

CMD ["/usr/bin/java", "-version"]
