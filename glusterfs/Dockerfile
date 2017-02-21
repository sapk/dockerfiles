FROM finalduty/archlinux:daily
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

RUN pacman -Sy --noconfirm glusterfs \
 && yes | pacman -Scc \
 && rm -r /usr/share/man/* \
 && rm -r /usr/share/locale/* 

CMD ["/usr/sbin/glusterd","--no-daemon","--log-level", "INFO", "--log-file", "/dev/stdout"] 
