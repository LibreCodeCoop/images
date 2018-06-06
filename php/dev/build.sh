#!/usr/bin/env bash

docker build -t lyseontech/php-dev .
docker tag lyseontech/php-dev lyseontech/php-dev:v${1}
docker push lyseontech/php-dev:v${1}
docker push lyseontech/php-dev:latest
