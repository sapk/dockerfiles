FROM alpine
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN apk add --no-cache --no-progress  ca-certificates python py-pip git \
 && pip install virtualenv uwsgi \
 && git clone https://github.com/certsocietegenerale/fame && cd fame \
 && echo "1" | utils/run.sh utils/install.py
 
#TODO remove git
#TODO separate worker and web

WORKDIR /fame
EXPOSE 4200 
ENTRYPOINT ["/fame/utils/run.sh"]
CMD ["webserver.py"]
