FROM --platform $BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM


COPY . /go/src/github.com/sapk/docker-volume-rclone
WORKDIR /go/src/github.com/sapk/docker-volume-rclone

RUN apk add --no-cache make git
RUN make clean build
RUN go get -u -v github.com/ncw/rclone


FROM alpine
LABEL maintainer="Antoine GIRARD <antoine.girard@sapk.fr>"

RUN apk add --no-cache ca-certificates

COPY --from=build /go/bin/rclone /usr/bin/rclone

ENTRYPOINT [ "/usr/bin/rclone" ]
#CMD [ "/usr/bin/rclone" ]