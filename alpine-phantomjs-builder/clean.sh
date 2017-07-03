#!/bin/bash

IMAGE="alpine-phantomjs-builder"
echo "Cleaning up build image."
if docker images $IMAGE | grep -v REPOSITORY | grep ...; then
  echo "Removing image: $IMAGE"
  docker rmi "$IMAGE"
else
  echo "Could not find image: $IMAGE"
  exit 1
fi
exit 0
