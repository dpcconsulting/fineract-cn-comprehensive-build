#!/bin/bash

echo ""
echo "Building libraries..."
echo ""

directories=(
    "fineract-cn-anubis"
)

for i in "${directories[@]}"; do
  echo ""
  echo "Building $i library..."
  echo ""
  cd $i
  chmod +x gradlew
  ./gradlew publishToMavenLocal
  cd ..
done