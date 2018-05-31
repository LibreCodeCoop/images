#!/usr/bin/env bash

docker build -t lyseontech/quasar .
docker tag lyseontech/quasar lyseontech/quasar:v${1}
docker push lyseontech/quasar:v${1}
docker push lyseontech/quasar:latest
