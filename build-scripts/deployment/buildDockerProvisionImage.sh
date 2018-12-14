#!/usr/bin/env bash

SRV=fineract-cn-provision

echo ""
echo "Building docker $SRV image ..."
docker build . --build-arg -f ./docker-scripts/build-script-provision//Dockerfile -t $SRV
echo "$SRV build done."
