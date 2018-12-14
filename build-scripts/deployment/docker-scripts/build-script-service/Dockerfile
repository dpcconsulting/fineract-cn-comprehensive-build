FROM openjdk:8-jre-alpine

ARG SERVICE
ENV SERVICE_NAME=${SERVICE}
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
ENV START_SLEEP=40
ENV JAVA_OPTS=''
ENV MAX_HEADER_SIZE='16384'

# Eureka
ENV EUREKA_URL='http://localhost:8761/eureka/'

# Cassandra Connection Settings
ENV CASSANDRA_CONTACTPOINTS='127.0.0.1:9042'
ENV CASSANDRA_USER='cassandra'
ENV CASSANDRA_PWD='password'
ENV CASSANDRA_KEYSPACE='seshat'
ENV CASSANDRA_CL='LOCAL_QUORUM'
ENV CASSANDRA_CLUSTERNAME='datacenter1'

# MariaDB Connection Settings
ENV DB_HOST='localhost'
ENV DB_PORT='3306'
ENV DB_USER='root'
ENV DB_PASS='mysql'
ENV DB_NAME='seshat'

# ActiveMQ Settings
ENV MQ_URL='tcp://localhost:61616'
ENV MQ_USER='admin'
ENV MQ_PASS='admin'

# commands
RUN adduser -D -s /bin/bash fineract
WORKDIR /home/fineract

RUN apk add --no-cache bash

COPY jars/${SERVICE}/service-0.1.0-BUILD-SNAPSHOT-boot.jar ./jars/${SERVICE}/service-0.1.0-BUILD-SNAPSHOT-boot.jar
COPY docker-scripts/build-script-service/run.sh run.sh
RUN chmod 755 run.sh && chown fineract:fineract run.sh
USER fineract

ENTRYPOINT ["bash", "./run.sh"]

EXPOSE 8080
