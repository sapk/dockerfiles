FROM finalduty/archlinux:daily
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

RUN pacman -Sy --noconfirm glusterfs \
 && yes | pacman -Scc \
 && rm -r /usr/share/man/* \
 && rm -r /usr/share/locale/* 

EXPOSE 111 24007 24008 38465-38469 49152-49162 
CMD ["/usr/bin/glusterd", "--no-daemon", "--log-level", "INFO", "--log-file", "/dev/stdout"] 
