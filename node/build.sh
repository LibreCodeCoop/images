#!/usr/bin/env bash

DIR_NAME=$(dirname $(readlink -f ${0}))

docker build -t lyseontech/node ${DIR_NAME}/${1}
docker tag lyseontech/node lyseontech/node:v${1}
docker push lyseontech/node:v${1}
docker push lyseontech/node:latest
