#!/bin/sh

ADDR=3392:192.168.11.109:3389
SERVER=admin@a.systec-pbx.net
SERVER_PORT=10010

docker rm -f tianyonghao
docker run -d --name tianyonghao --restart unless-stopped \
    -v /root/.ssh/id_rsa:/id_rsa \
    cherry sh -c "/usr/bin/autossh -M 0 -p ${SERVER_PORT} -i /id_rsa -o \"StrictHostKeyChecking no\" -o \"ExitOnForwardFailure yes\" -o \"ConnectTimeout=3\" -o \"ServerAliveInterval 60\" -o \"ServerAliveCountMax 3\" -CNR ${ADDR} ${SERVER}"
