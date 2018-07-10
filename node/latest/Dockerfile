FROM node:9.11.2

RUN mkdir -p /var/www/app \
 && chown -R node:node /var/www \
 && apt-get update \
 && apt-get install -y git --no-install-recommends \
 && rm -rf /var/lib/apt/lists/* \
 && wget -O /tini https://github.com/krallin/tini/releases/download/v0.18.0/tini-static \
 && chmod +x /tini

WORKDIR /var/www/app

ENTRYPOINT ["/tini", "--"]

CMD ["node"]
