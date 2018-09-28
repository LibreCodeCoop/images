FROM  node:alpine

RUN apk --update add openssh-client git

RUN npm install -g vue-cli && \
    npm install -g @vue/cli@3.0.0 && \
    npm install -g @vue/cli-init@3.0.0

RUN mkdir /home/node/app
USER root

# VOLUME [ "/home/node/app" ]
WORKDIR /home/node/app

CMD /bin/sh