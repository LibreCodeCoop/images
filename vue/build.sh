#!/usr/bin/env bash

DIR_NAME=$(dirname $(readlink -f ${0}))

docker build -t lyseontech/vue ${DIR_NAME}/${1}
docker tag lyseontech/vue lyseontech/vue:v${1}
docker push lyseontech/vue:v${1}
docker push lyseontech/vue:latest
