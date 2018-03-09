#!/bin/bash
# Loops through all Dockerfiles building them and tagging them

set -ex

# First build the base docker file
docker build -t avvo/ruby-ubuntu-base:latest -f Dockerfile.ubuntu-base .

for FILE in Dockerfile.?.*; do
	VERSION=$(echo "${FILE}" | cut -c 12-14)
	IMAGE_NAME="avvo/ruby-ubuntu:${VERSION}"
	docker build -t "${IMAGE_NAME}" -f "${FILE}" .
	docker push "${IMAGE_NAME}"
done
