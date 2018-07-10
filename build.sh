#!/usr/bin/env bash

LTI_DIR_NAME=$(dirname $(readlink -f ${0}))

LTI_IMAGE=${1}
LTI_VERSION=${2}
LTI_NAMESPACE=lyseontech/${LTI_IMAGE}
LTI_VALID=""

function __validate
{
  LTI_VALID=""
  for entry in "${2}"/*
  do
    option=$(basename ${entry})
    if [[ ${option} == ${1} ]]; then
      LTI_VALID="true"
      return
    fi
  done
}

function __build
{
  __validate ${LTI_IMAGE} ${LTI_DIR_NAME}
  if [[ -z ${LTI_VALID} ]];then
    echo "Invalid image '${LTI_IMAGE}'"
  fi

  __validate ${LTI_VERSION} ${LTI_DIR_NAME}/${LTI_IMAGE}
  if [[ -z ${LTI_VALID} ]]; then
    echo "Invalid version '${LTI_VERSION}'"
    return
  fi

  if [[ ! -d ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION} ]]; then
    echo "Invalid build '${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}'"
    return
  fi

  mkdir -p ${LTI_DIR_NAME}/${LTI_IMAGE}/latest

  cp ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}/Dockerfile ${LTI_DIR_NAME}/${LTI_IMAGE}/latest/Dockerfile

  docker build -t ${LTI_NAMESPACE} ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}
  docker tag ${LTI_NAMESPACE} ${LTI_NAMESPACE}:v${LTI_VERSION}
  docker push ${LTI_NAMESPACE}:v${LTI_VERSION}
  docker push ${LTI_NAMESPACE}:latest
}

__build
