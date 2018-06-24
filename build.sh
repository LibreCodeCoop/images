#!/usr/bin/env bash

DIR_NAME=$(dirname $(readlink -f ${0}))

IMAGE=${1}
VERSION=${2}

sh ${DIR_NAME}/${IMAGE}/build.sh ${VERSION}
