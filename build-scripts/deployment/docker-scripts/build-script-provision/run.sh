#!/usr/bin/env bash

if [ "$PROVISION" = "true"  ]; then
    echo "-- FULL PROVISON --"
else
    echo "-- Migration --"
fi

echo "Is Persistent: $PERSISTENT"
echo "Eureka will running on http://localhost:8761/"
echo "Starting Provision App ..."

DEPLOY_JAR_FILE='./jars/fineract-cn-provision-client/provision-client-0.1.0-BUILD-SNAPSHOT.jar'
JARS_DIR=`pwd`/jars

java -Djarsdir=$JARS_DIR \
    -Ddeployserver.persistent=$PERSISTENT \
    -Ddeployserver.provision=$PROVISION \
    -Dcustom.cassandra.contactPoints=$CASSANDRA_CONTACTPOINTS \
    -Dcassandra.cluster.user=$CASSANDRA_USER \
    -Dcassandra.cluster.pwd=$CASSANDRA_PWD \
    -Dcassandra.keyspace=$CASSANDRA_KEYSPACE \
    -Dcustom.mariadb.host=$MARIADB_HOST \
    -Dcustom.mariadb.port=$MARIADB_PORT \
    -Dcustom.mariadb.user=$MARIADB_USER \
    -Dcustom.mariadb.password=$MARIADB_PASS \
    -jar $DEPLOY_JAR_FILE
