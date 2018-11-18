FROM sapk/archlinux:root.x86_64
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

RUN pacman -Sy --noconfirm glusterfs \
 && yes | pacman -Scc \
 && rm -r /usr/share/man/* \
 && rm -r /usr/share/locale/* 

#TODO update default port list
EXPOSE 111 24007 24008 38465-38469 49152-49162 

ENTRYPOINT ["/usr/bin/glusterd"] 
CMD ["--no-daemon", "--log-level", "INFO", "--log-file", "/dev/stdout"] 
