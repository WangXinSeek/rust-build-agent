#!/usr/bin/env bash

set -e

BUILD_NUMBER=$1
if [ -z "$BUILD_NUMBER" ]; then
  echo "Build number required"
  exit 1
fi

CONTAINER="dockerregistry-v2.seekinfra.com/houston/rust-build-agent"
CONTAINER_BUILD="$CONTAINER:$BUILD_NUMBER"

echo "Build docker image for rust-build-agent"
docker build -t "$CONTAINER:$BUILD_NUMBER" .
docker tag -f "$CONTAINER:$BUILD_NUMBER" "$CONTAINER:latest"
docker push "$CONTAINER:$BUILD_NUMBER"
docker push "$CONTAINER:latest"

trap : 0
