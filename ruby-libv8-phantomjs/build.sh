#!/bin/bash

VERSION=$1
source .dockerbuild

if [ "x$VERSION" == "x" ];
then
	VERSION="latest"
fi

function buildfail() {
  echo "ERROR: Build Failure - $@"
  exit 1
}

IMAGE="$REPO/$NAME:$VERSION"
docker build --rm -t "$IMAGE" . || buildfail "Could not build image."

## These commands like to complain about the registry ssl cert.
## May have to add --insecure-registry registry.docker.prod.avvo.com
## to your *docker daemon* args for this to work.
#docker tag -f $NAME:$VERSION registry.docker.prod.avvo.com/$NAME
docker push "$IMAGE" || buildfail "Build succeeded but could not push image to remote repo."
