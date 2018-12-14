#!/bin/bash

echo ""
echo "Building core libraries..."
echo ""

directories=(
    "fineract-cn-lang"
    "fineract-cn-api"
    "fineract-cn-async"
    "fineract-cn-cassandra"
    "fineract-cn-mariadb"
    "fineract-cn-data-jpa"
    "fineract-cn-command"
    "fineract-cn-test"
)

for i in "${directories[@]}"; do
  echo ""
  echo "Building $i core library..."
  echo ""
  cd $i
  chmod +x gradlew
  ./gradlew publishToMavenLocal
  cd ..
done