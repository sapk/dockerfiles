FROM scratch 
LABEL maintainer Antoine GIRARD <antoine.girard@sapk.fr>

ADD https://mirrors.kernel.org/archlinux/iso/latest/archlinux-bootstrap-2017.03.01-x86_64.tar.gz /
SHELL ["/bin/bash", "-c"]

RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 

ONBUILD RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
CMD /bin/bash
