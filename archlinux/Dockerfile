FROM scratch 
MAINTAINER Antoine GIRARD <antoine.girard@sapk.fr>
ADD https://mirrors.kernel.org/archlinux/iso/latest/archlinux-bootstrap-2017.02.01-x86_64.tar.gz /
ONBUILD RUN pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; rm -r /usr/share/locale/* 
