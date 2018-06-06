#!/usr/bin/env bash

docker build -t lyseontech/vue .
docker tag lyseontech/vue lyseontech/vue:v${1}
docker push lyseontech/vue:v${1}
docker push lyseontech/vue:latest
