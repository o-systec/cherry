#!/bin/sh

ADDR=3391:192.168.11.230:3389
SERVER=admin@a.systec-pbx.net
SERVER_PORT=10010

docker rm -f miaokai
docker run -d --name miaokai --restart unless-stopped \
    -v /root/.ssh/id_rsa:/id_rsa \
    cherry sh -c "/usr/bin/autossh -M 0 -p ${SERVER_PORT} -i /id_rsa -o \"StrictHostKeyChecking no\" -o \"ExitOnForwardFailure yes\" -o \"ConnectTimeout=3\" -o \"ServerAliveInterval 60\" -o \"ServerAliveCountMax 3\" -CNR ${ADDR} ${SERVER}"
