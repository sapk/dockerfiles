FROM node:slim
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

ENV SDK="android-sdk_r24.4.1-linux.tgz"
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/share/android-sdk-linux/tools"

RUN apt-get update && apt-get upgrade && apt-get install -y default-jdk

RUN npm install -g cordova gulp

RUN cd /usr/share \
    && wget "http://dl.google.com/android/$SDK" \
    && tar xf $SDK && rm $SDK && cd android-sdk-linux \
    && android list sdk --all \
    && echo y | android update sdk -u -a -t 1,3,4,26

VOLUME /workdir
WORKDIR /workdir

ENTRYPOINT ["/bin/bash"]
