#!/usr/bin/env bash

deployment_ui="../deployment/ui"
NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    nvm use 8
fi


echo ""
echo "building fineract-cn-fims-web-app..."
echo ""

cd fineract-cn-fims-web-app
if [ ! -d "node_modules" ]; then
    echo "Install dependencies..."
    npm i
else
    echo "Dependencies are installed."
fi

npm run build

mkdir -p ../$deployment_ui/fineract-cn-fims-web-app/
cp -rf ./dist ../$deployment_ui/fineract-cn-fims-web-app/
cp -rf ./scripts ../$deployment_ui/fineract-cn-fims-web-app/

cd ..
