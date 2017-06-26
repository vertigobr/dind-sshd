#!/bin/bash
IMGVERSION=$(head -n 1 .IMGVERSION)
IMGVERSION=${IMGVERSION:-"latest"}
IMGNAME=$(head -n 1 .IMGNAME)
docker run --rm --privileged -ti --entrypoint "/bin/sh" \
  "$IMGNAME:$IMGVERSION" $@
