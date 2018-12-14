#!/usr/bin/env bash

echo ""
echo "Build Docker Images ..."
echo ""

. envServices.sh

for i in "${service_directories[@]}"; do
    ./buildDockerServiceImage.sh $i
done

echo "Done."
