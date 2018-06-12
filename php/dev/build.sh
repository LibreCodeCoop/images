#!/usr/bin/env bash

docker build -t lyseontech/php-apache-dev .
docker tag lyseontech/php-apache-dev lyseontech/php-apache-dev:v${1}
docker push lyseontech/php-apache-dev:v${1}
docker push lyseontech/php-apache-dev:latest
