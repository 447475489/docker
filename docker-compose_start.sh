#!/bin/bash

docker rm -f bussale bussync ticket-api >/dev/null 2>&1
# docker-bussale-1 docker-bussync-1 docker-ticket-api-1
cd /opt/project/docker
docker-compose down
docker-compose up -d
