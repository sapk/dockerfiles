# aol/moloch server
# Think of it reading : http://jerrygamblin.com/2016/05/28/a-docker-container-to-capture-all-traffic-from-host/

FROM debian
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

#Dep for capture
RUN apt-get update && apt-get install -y \
 wget curl libpcre3-dev uuid-dev libmagic-dev pkg-config g++ flex bison zlib1g-dev libffi-dev gettext libgeoip-dev make libjson-perl libbz2-dev libwww-perl libpng-dev xz-utils libffi-dev

# Get moloch src
RUN mkdir /app && cd /app
RUN git clone https://github.com/aol/moloch.git && cd moloch

WORKDIR /app/moloch
CMD /app/moloch/capture/run.sh & /app/moloch/viewer/run.sh
