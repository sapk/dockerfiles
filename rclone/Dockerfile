FROM golang:alpine AS build-env

RUN apk add --no-cache git
RUN go get -u -v github.com/ncw/rclone

RUN /go/bin/rclone version

FROM alpine
LABEL maintainer="Antoine GIRARD <antoine.girard@sapk.fr>"

RUN apk add --no-cache ca-certificates bash fuse
COPY --from=build-env /go/bin/rclone /usr/bin/rclone

CMD [ "/usr/bin/rclone" ]
