FROM node:slim

RUN npm install --quiet --global \
      vue-cli@2.9.5 \
      quasar-cli@0.16.4

RUN mkdir -p /var/www/app && \
    chown -R node:node /var/www && \
    wget -O /tini https://github.com/krallin/tini/releases/download/v0.16.1/tini-static && \
    chmod +x /tini

USER node

WORKDIR /var/www/app

ENTRYPOINT ["/tini", "--"]

CMD ["node"]
