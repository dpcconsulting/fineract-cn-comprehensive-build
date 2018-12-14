#!/usr/bin/env bash

SLEEP $START_SLEEP

java $JAVA_OPTS -Dserver.maxHttpHeaderSize=$MAX_HEADER_SIZE \
    -Deureka.client.serviceUrl.defaultZone=$EUREKA_URL \
    -Dactivemq.brokerUrl=$MQ_URL -Dactivemq.username=$MQ_USER -Dactivemq.password=$MQ_PASS \
    -Dmariadb.host=$DB_HOST -Dmariadb.port=$DB_PORT -Dmariadb.database=$DB_NAME \
    -Dmariadb.user=$DB_USER -Dmariadb.password=$DB_PASS \
    -Dcassandra.contactPoints=$CASSANDRA_CONTACTPOINTS -Dcassandra.cluster.user=$CASSANDRA_USER \
    -Dcassandra.cluster.pwd=$CASSANDRA_PWD -Dcassandra.keyspace=$CASSANDRA_KEYSPACE \
    -Dcassandra.clustername=$CASSANDRA_CLUSTERNAME \
    -Dcassandra.cl.read=$CASSANDRA_CL -Dcassandra.cl.write=$CASSANDRA_CL -Dcassandra.cl.delete=$CASSANDRA_CL \
    -jar jars/$SERVICE_NAME/service-0.1.0-BUILD-SNAPSHOT-boot.jar
