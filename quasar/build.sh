#!/usr/bin/env bash

DIR_NAME=$(dirname $(readlink -f ${0}))

docker build -t lyseontech/quasar ${DIR_NAME}/${1}
docker tag lyseontech/quasar lyseontech/quasar:v${1}
docker push lyseontech/quasar:v${1}
docker push lyseontech/quasar:latest
