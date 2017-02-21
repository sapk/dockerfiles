FROM finalduty/archlinux:daily
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

RUN pacman -Syu --noconfirm glusterfs \
 && yes | pacman -Scc \
 && rm -r /usr/share/man/* \
 && rm -r /usr/share/locale/* 

CMD /usr/bin/glusterd
