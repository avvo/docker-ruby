#!/bin/bash
set -e
# clean up failed builds
rmdir ./artifacts-* >/dev/null 2>&1 || /bin/true
IMAGE="alpine-phantomjs-builder"
NAME="phantomjs-alpine-x86_64.tar.bz2"
TS=`date '+%Y%m%d-%H%M%S'`
OUTDIR="artifacts-$TS"
mkdir -p "./$OUTDIR"
docker build --rm -t $IMAGE . && docker run --rm -i -v `pwd`/$OUTDIR:/artifacts $IMAGE cp /root/phantomjs.tar.bz2 /artifacts/${NAME}
./push.sh "./$OUTDIR/$NAME"
