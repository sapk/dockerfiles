# Cloud9 server
# A lot inspired by https://hub.docker.com/r/gai00/cloud9/~/dockerfile/
#                   https://hub.docker.com/r/kdelfour/cloud9-docker/~/dockerfile/
#
# Notes: 
# This dockerfile may not work on RPi you can find more info on how make it work on this issue:
# https://github.com/sapk/dockerfiles/issues/40

FROM node:slim
LABEL maintainer="Antoine GIRARD <antoine.girard@sapk.fr>"

ENV LANG=en_US.UTF-8

RUN buildDeps='make build-essential g++ gcc python2.7 locales' && softDeps="tmux git" \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y $buildDeps $softDeps --no-install-recommends \
 && locale-gen en_US.UTF-8 \
 && npm install -g forever && npm cache clean --force \
 && git clone --depth=5 https://github.com/c9/core.git /cloud9 && cd /cloud9 \
 && scripts/install-sdk.sh \
 && apt-get purge -y --auto-remove $buildDeps \
 && apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && npm cache clean --force \
 && git reset --hard
 
VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "--listen", "0.0.0.0"]

CMD ["--auth","c9:c9"]
