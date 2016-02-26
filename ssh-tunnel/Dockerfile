
# A docker file to run a sshd server for only tunnelling (socks proxy)
# Inspired from  :  - https://hub.docker.com/r/matttbe/docker-ssh-tunnel

FROM alpine:latest
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk --no-cache --no-progress add openssh shadow \
 && useradd --shell /bin/false --create-home --user-group tunnel \
 && printf "\nMatch User tunnel\nAllowTcpForwarding yes\nX11Forwarding no\n" >> /etc/ssh/sshd_config \
 && printf "\nChallengeResponseAuthentication no\nPasswordAuthentication no\nUsePAM no\n" >> /etc/ssh/sshd_config

VOLUME ["/home/tunnel/.ssh/"] 
#Mount add authorized_keys in it.

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
