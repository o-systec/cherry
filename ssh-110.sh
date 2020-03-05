#!/bin/sh

ADDR=1225:192.168.11.110:22
SERVER=admin@fishblue.net
SERVER_PORT=10086

docker rm -f ssh-110
docker run -d --name ssh-110 --restart unless-stopped \
    -v /root/.ssh/cloud.id_rsa:/id_rsa \
    cherry sh -c "/usr/bin/autossh -M 0 -p ${SERVER_PORT} -i /id_rsa -o \"StrictHostKeyChecking no\" -o \"ExitOnForwardFailure yes\" -o \"ConnectTimeout=3\" -o \"ServerAliveInterval 60\" -o \"ServerAliveCountMax 3\" -CNR ${ADDR} ${SERVER}"
