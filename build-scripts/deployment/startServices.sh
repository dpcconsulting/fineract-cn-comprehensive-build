#!/usr/bin/env bash

if [ ! -f "envServices.sh" ]; then
    echo "Can't start services. envServices.sh not found."
    exit 1
fi

if [ -f nohup.out ]; then
    backup_date=`date +'%Y-%m-%d'`
    mv nohup.out nohup_$backup_date.bak
fi

. envServices.sh

echo ""
echo "Starting Services..."
for i in "${service_directories[@]}"; do
    echo ""
    echo "Starting $i service ..."

    nohup java $JAVA_OPTS -Dserver.maxHttpHeaderSize=16384 \
    -Dport=$PORT \
    -Deureka.client.serviceUrl.defaultZone=$EUREKA_URL \
    -Dactivemq.brokerUrl=$MQ_URL -Dactivemq.username=$MQ_USER -Dactivemq.password=$MQ_PASS \
    -Dmariadb.host=$DB_HOST -Dmariadb.port=$DB_PORT -Dmariadb.database=$DB_NAME \
    -Dmariadb.user=$DB_USER -Dmariadb.password=$DB_PASS \
    -Dcassandra.contactPoints=$CASSANDRA_CONTACTPOINTS -Dcassandra.cluster.user=$CASSANDRA_USER \
    -Dcassandra.cluster.pwd=$CASSANDRA_PWD -Dcassandra.keyspace=$CASSANDRA_KEYSPACE \
    -Dcassandra.clustername=$CASSANDRA_CLUSTERNAME \
    -Dcassandra.cl.read=$CASSANDRA_CL -Dcassandra.cl.write=$CASSANDRA_CL -Dcassandra.cl.delete=$CASSANDRA_CL \
    -jar jars/$i/service-0.1.0-BUILD-SNAPSHOT-boot.jar 2>&1 &
    echo $! > /tmp/$i.pid
    echo "pid: " $!
done

echo "Done."
echo ""
