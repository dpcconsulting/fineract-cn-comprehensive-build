#!/usr/bin/env bash

SRV=$1

if [[ -z "$SRV" ]]; then
    echo "service parameter is missing."
    echo "./buildDockerImage.sh fineract-cn-service-name"
    exit 1
fi

echo ""
echo "Building docker image for $SRV service ..."
docker build . --build-arg SERVICE=$SRV -f ./docker-scripts/build-script-service/Dockerfile -t $SRV
echo "$SRV build done."
