# Cloud9 server for glang dev
# A lot inspired by https://hub.docker.com/_/golang/ (near similar instruction but based on cloud9, GOPATH /workspace)

FROM sapk/cloud9:alpine
LABEL maintainer="Antoine GIRARD <antoine.girard@sapk.fr>"

RUN apk -U --no-cache --force --no-progress add go

ENV GOPATH /workspace
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
