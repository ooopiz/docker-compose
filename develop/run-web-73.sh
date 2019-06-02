#!/bin/bash

if [ "$1" != "" ]; then
    echo "Contianer name is $1"
else
    echo "Usage: sh xxx.sh {container_name} {web_dir}"
    exit
fi

if [ "$2" != "" ]; then
    echo "Web dir is $2"
else
    echo "Usage: sh xxx.sh {container_name} {web_dir}"
    exit
fi

PREFIX="develop"

PROJECT_NAME="${PREFIX}-$1"

docker run -itd \
    --network "${PREFIX}_default" \
    --link mysql56:mysql56 \
    -v "$2":/var/www/laravel-app \
    -p 80:80 \
    --name "$PROJECT_NAME" \
    loopbai/laravel-server:php7.3

