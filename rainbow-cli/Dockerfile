FROM node:alpine

LABEL org.label-schema.schema-version = 1.0.0 \
    org.label-schema.vendor = antoine.girard@sapk.fr \
    org.label-schema.vcs-url = https://github.com/sapk/dockerfiles \
    org.label-schema.description = "Alcatel Rainbow CLI interface" \
    org.label-schema.docker.cmd= "docker run -ti --rm -v rainbow-preferences:/data/.config/preferences sapk/rbw login 'sandbox-user' 'sandbox-pass'" \
    org.label-schema.docker.cmd.help = "docker run -ti --rm -v rainbow-preferences:/data/.config/preferences sapk/rbw --help" \
    org.label-schema.docker.debug = "docker run -ti --rm -v rainbow-preferences:/data/.config/preferences --entrypoint=/bin/sh sapk/rbw" \
    org.label-schema.name = "rbw"

RUN npm install -g rainbow-cli && mkdir /data

ENV HOME=/data
VOLUME ["/data/.config/preferences"]

ENTRYPOINT [ "/usr/local/bin/rbw" ]
CMD [ "--help" ]

