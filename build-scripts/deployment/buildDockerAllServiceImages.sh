#!/usr/bin/env bash

echo ""
echo "Build Docker Images ..."
echo ""

. envServices.sh

# docker build . --build-arg service=fineract-cn-identity -f ./docker-scripts/build-script-service/Dockerfile

for i in "${service_directories[@]}"; do
    ./buildDockerImage.sh $i
done

echo "Done."
