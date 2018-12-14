#!/bin/bash

echo ""
echo "Building base libraries..."
echo ""

directories=(
    "fineract-cn-crypto"
)

for i in "${directories[@]}"; do
  echo ""
  echo "Building $i base library..."
  echo ""
  cd $i
  chmod +x gradlew
  ./gradlew publishToMavenLocal
  cd ..
done