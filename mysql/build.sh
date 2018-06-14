#!/usr/bin/env bash

docker build -t lyseontech/mysql .
docker tag lyseontech/mysql lyseontech/mysql:v${1}
docker push lyseontech/mysql:v${1}
docker push lyseontech/mysql:latest
