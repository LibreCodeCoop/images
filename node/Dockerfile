FROM node:9.11.1-slim

RUN mkdir -p /var/www/app && \
    chown -R node:node /var/www && \
    wget -O /tini https://github.com/krallin/tini/releases/download/v0.16.1/tini-static && \
    chmod +x /tini

USER node

WORKDIR /var/www/app

ENTRYPOINT ["/tini", "--"]

CMD ["node"]
