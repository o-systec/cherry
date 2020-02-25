#!/bin/sh

ADDR=1024:localhost:80
SERVER=admin@systec-pbx.net
SERVER_PORT=10086

docker rm -f cherry
docker run -d --name cherry --restart unless-stopped \
    -v /home/yanggz/.ssh/id_rsa:/id_rsa \
    cherry  /usr/bin/autossh "-M 0 -p ${SERVER_PORT} -i /id_rsa -o \"StrictHostKeyChecking no\" -o \"ExitOnForwardFailure yes\" -o \"ConnectTimeout=3\" -o \"ServerAliveInterval 60\" -o \"ServerAliveCountMax 3\" -CNR ${ADDR} ${SERVER}"
