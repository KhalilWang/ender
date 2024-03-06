#!/bin/bash

docker compose down
rm -rf ~/tmp/.postgres-data
docker compose --env-file env up -d