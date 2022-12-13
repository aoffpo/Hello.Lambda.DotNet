#!/usr/bin/env bash
echo 'Run localstack with all services'
docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 \
-e LAMBDA_EXECUTOR=docker \
-e LAMBDA_DOCKER_FLAGS='-p 19891:19891' \
-e DEBUG=1 \
localstack/localstack