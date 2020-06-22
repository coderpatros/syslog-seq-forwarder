#!/usr/bin/env bash
mkdir --parents data
docker run \
  --name seq \
  -e ACCEPT_EULA=Y \
  -v /data:/data \
  -p 8080:80 \
  datalust/seq:latest
docker rm seq