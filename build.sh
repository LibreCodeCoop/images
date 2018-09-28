#!/usr/bin/env bash

LTI_DIR_NAME=$(dirname $(readlink -f ${0}))

LTI_IMAGE=${1}
LTI_VERSION=${2}
LTI_NAMESPACE=lyseontech/${LTI_IMAGE}
LTI_VALID=""

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

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
    echo -e "${RED} ~> Invalid image '${LTI_IMAGE}'${NC}"
    return
  fi

  __validate ${LTI_VERSION} ${LTI_DIR_NAME}/${LTI_IMAGE}
  if [[ -z ${LTI_VALID} ]]; then
    echo -e "${RED} ~> Invalid version '${LTI_VERSION}'${NC}"
    return
  fi

  if [[ ! -d ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION} ]]; then
    echo -e "${RED} ~> Invalid build '${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}'${NC}"
    return
  fi

  if [[ ! -d ${LTI_DIR_NAME}/${LTI_IMAGE}/latest ]]; then
    mkdir -p ${LTI_DIR_NAME}/${LTI_IMAGE}/latest
  fi
  cp ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}/Dockerfile ${LTI_DIR_NAME}/${LTI_IMAGE}/latest/Dockerfile

  echo -e "${GREEN} ~> Building '${LTI_NAMESPACE}' with '${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}/Dockerfile'${NC}"
  docker build -t ${LTI_NAMESPACE} ${LTI_DIR_NAME}/${LTI_IMAGE}/${LTI_VERSION}

  echo -e "${GREEN} ~> Tagging '${LTI_IMAGE}' with 'v${LTI_VERSION}'${NC}"
  docker tag ${LTI_NAMESPACE} ${LTI_NAMESPACE}:v${LTI_VERSION}

  echo -e "${GREEN} ~> Pushing '${LTI_NAMESPACE}:v${LTI_VERSION}'${NC}"
  docker push ${LTI_NAMESPACE}:v${LTI_VERSION}

  echo -e "${GREEN} ~> Pushing '${LTI_NAMESPACE}:latest'${NC}"
  docker push ${LTI_NAMESPACE}:latest

  echo -e "${GREEN} ~> All successfully done ${NC}"
}

__build
