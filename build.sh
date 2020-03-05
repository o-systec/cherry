#!/bin/bash

REGISTRY_URL=${REGISTRY_URL:=registry.cn-hangzhou.aliyuncs.com}
NAMESPACE=${NAMESPACE:=ilifestyle}
IMAGE=${IMAGE:=cherry}

build() {
    docker build -t $NAMESPACE/$IMAGE .
}

login() {
    docker login $REGISTRY_URL
}

logout() {
    docker logout $REGISTRY_URL
}

pull() {
    docker pull $REGISTRY_URL/$NAMESPACE/$IMAGE
    docker tag $REGISTRY_URL/$NAMESPACE/$IMAGE $NAMESPACE/$IMAGE
}

push() {
    docker tag $NAMESPACE/$IMAGE $REGISTRY_URL/$NAMESPACE/$IMAGE
    docker push $REGISTRY_URL/$NAMESPACE/$IMAGE
}

case $1 in
    build)
        build
    ;;
    login)
        login
    ;;
    logout)
        logout
    ;;
    pull)
        pull
    ;;
    push)
        push
    ;;
    download)
        exit 0
    ;;
    *)
        echo "Usage: $0 {build}"
        echo "       $0 {login|logout}"
        echo "       $0 {pull|push}"
    ;;
esac

