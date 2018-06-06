#!/usr/bin/env bash

docker build -t lyseontech/node .
docker tag lyseontech/node lyseontech/node:v${1}
docker push lyseontech/node:v${1}
docker push lyseontech/node:latest
