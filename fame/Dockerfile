FROM alpine
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk -U --no-cache --no-progress upgrade \
 && apk add --no-cache --no-progress  ca-certificates mongodb python py-pip uwsgi git gcc \
 && pip install virtualenv \
 && git clone https://github.com/certsocietegenerale/fame && cd fame \
 && (mongod &) && sleep 30s \
 && echo "1" | utils/run.sh utils/install.py \
 && apk del --purge git gcc

WORKDIR /fame
EXPOSE 4200 
ENTRYPOINT ["/fame/utils/run.sh"]
CMD ["webserver.py"]

#Use a external mongodb and execute install at startup ?
