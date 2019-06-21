# Cloud9 server
# A lot inspired by https://hub.docker.com/r/gai00/cloud9/~/dockerfile/
#                   https://hub.docker.com/r/kdelfour/cloud9-docker/~/dockerfile/

FROM node:8-alpine
LABEL maintainer="Antoine GIRARD <antoine.girard@sapk.fr>"
 
RUN apk -U --no-cache --no-progress upgrade \
 && apk -U --no-cache --force --no-progress add bash tmux git make gcc g++ python sqlite wget openssl ca-certificates \
 && npm install -g forever && npm cache clean --force \
 && git clone --depth=5 https://github.com/c9/core.git /root/.c9 && cd /root/.c9 \
 && npm install pty.js \
 && mkdir -p ./node/bin ./bin ./node_modules \		
 && ln -sf "`which tmux`" ./bin/tmux \		
 && ln -s "`which node`" ./node/bin/node \		
 && ln -s "`which npm`" ./node/bin/npm \
 && echo 1 > ./installed \
 && NO_PULL=1 ./scripts/install-sdk.sh \
 && npm cache clean --force && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* \
 && git reset --hard

 
VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/root/.c9/server.js", "-w", "/workspace", "--listen", "0.0.0.0"]

CMD ["--auth","c9:c9"]
