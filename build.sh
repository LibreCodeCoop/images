#!/usr/bin/env bash

LTI_DIR_NAME=$(dirname $(readlink -f ${0}))

LTI_IMAGE=${1}
LTI_VERSION=${2}
LTI_NAMESPACE=lyseontech/${LTI_IMAGE}

# ${LTI_DIR_NAME}/${LTI_IMAGE}/build.sh ${LTI_VERSION}
cp ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}/Dockerfile ${LTI_DIR_NAME}/${LTI_IMAGE}/latest/Dockerfile

docker build -t ${LTI_NAMESPACE} ${LTI_DIR_NAME}/${LTI_VERSION}
docker tag ${LTI_NAMESPACE} ${LTI_NAMESPACE}:v${LTI_VERSION}
docker push ${LTI_NAMESPACE}:v${LTI_VERSION}
docker push ${LTI_NAMESPACE}:latest
