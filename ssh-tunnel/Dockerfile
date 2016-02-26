
# A docker file to run a sshd server for only tunnelling (socks proxy)
# Inspired from  :  - https://hub.docker.com/r/matttbe/docker-ssh-tunnel

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk --no-cache --no-progress add tinyssh shadow \
 &&  useradd --shell /bin/false --create-home --user-group tunnel \
 && /usr/sbin/tinysshd-makekey /etc/tinysshd

VOLUME ["/home/tunnel/.ssh/"] 
#Mount add authorized_keys in it.

EXPOSE 22

ENTRYPOINT ["/usr/sbin/tinysshd"]

CMD ["-v","/etc/tinysshd"]

#To reset server key : docker exec -it tinysshd "rm -Rf /etc/tinysshd && /usr/sbin/tinysshd-makekey /etc/tinysshd"
# and restart
