#!/bin/bash
set -e
PUSHHOST=fs2wad.prod.avvo.com
PUSHDIR=/var/www
SHORTHOST=`echo "$PUSHHOST" | cut -f1 -d.`
ARTIFACT="$1"
if [ -n "$SUDO_USER" ]; then
  SSHUSER=$SUDO_USER
else
  SSHUSER=$USER
fi

read -p "Publish $ARTIFACT to $SHORTHOST? [y/N] " pushnow
if echo "$pushnow" | egrep -qi '^(y|yes)$'; then
  cmd="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $ARTIFACT $SSHUSER@$PUSHHOST:$PUSHDIR/"
  echo "Executing: $cmd"
  $cmd
fi
