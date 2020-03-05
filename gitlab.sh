#!/bin/sh

ADDR=1025:192.168.11.100:80
SERVER=admin@a.systec-pbx.net
SERVER_PORT=10086

docker rm -f gitlab
docker run -d --name gitlab --restart unless-stopped \
    -v /root/.ssh/id_rsa:/id_rsa \
    cherry sh -c "/usr/bin/autossh -M 0 -p ${SERVER_PORT} -i /id_rsa -o \"StrictHostKeyChecking no\" -o \"ExitOnForwardFailure yes\" -o \"ConnectTimeout=3\" -o \"ServerAliveInterval 60\" -o \"ServerAliveCountMax 3\" -CNR ${ADDR} ${SERVER}"
