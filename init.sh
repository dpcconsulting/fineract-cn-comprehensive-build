#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

#!/usr/bin/env bash

githubAccount=$1

if [[ -z "$githubAccount" ]]; then
    echo "GitHub Account parameter is missing."
    echo "./init.sh github-account-name"
    exit 1
fi

get_modules() {
  modules=("$@")
  for module in "${modules[@]}";
  do
    git clone https://github.com/$githubAccount/$module.git
    if [[ -d $module ]]; then
        cd $module
        git remote add upstream https://github.com/apache/$module.git
        if [[ -f $module/gradlew ]]; then
            # For some reason permission gets denied
            chmod +x gradlew
        fi
        cd ..
    else
        echo ""
        echo "Error: $module not found."
    fi
    echo ""
  done
}

module_group() {
    echo ""
    echo "Cloning $1 modules..."
    echo ""

    mkdir -p $1
    cd $1
}

# -------------
groupname="base"
modules=(
    "fineract-cn-crypto"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

groupname="core"
modules=(
    "fineract-cn-lang"
    "fineract-cn-api"
    "fineract-cn-async"
    "fineract-cn-cassandra"
    "fineract-cn-mariadb"
    "fineract-cn-data-jpa"
    "fineract-cn-command"
    "fineract-cn-test"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

groupname="libraries"
modules=(
    "fineract-cn-anubis"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

groupname="services"
modules=(
    "fineract-cn-identity"
    "fineract-cn-permitted-feign-client"
    "fineract-cn-provisioner"
    "fineract-cn-rhythm"
    "fineract-cn-template"
    "fineract-cn-office"
    "fineract-cn-customer"
    "fineract-cn-group"
    "fineract-cn-accounting"
    "fineract-cn-portfolio"
    "fineract-cn-deposit-account-management"
    "fineract-cn-cheques"
    "fineract-cn-payroll"
    "fineract-cn-teller"
    "fineract-cn-reporting"
    "fineract-cn-notifications"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

groupname="integration-tests"
modules=(
    "fineract-cn-default-setup"
    "fineract-cn-service-starter"
    "fineract-cn-demo-server"
    "fineract-cn-provision-client"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

groupname="ui"
modules=(
    "fineract-cn-fims-web-app"
    "fineract-cn-fims-e2e"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

groupname="tools"
modules=(
    "fineract-cn-comprehensive-build"
)

module_group $groupname
get_modules "${modules[@]}"
cd ..

# -------------

echo "Repository clone is done."

echo "Copy config to project directory ..."
cp -R tools/fineract-cn-comprehensive-build/build-scripts/ ./

echo "Build project ..."

chmod +x .buildAll.sh
./buildAll.sh

echo "Done."