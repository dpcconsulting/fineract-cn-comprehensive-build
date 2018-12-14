FROM openjdk:8-jre-alpine

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
ENV START_SLEEP=0
ENV JAVA_OPTS=''
ENV MAX_HEADER_SIZE='16384'

# Cassandra Connection Settings
ENV CASSANDRA_CONTACTPOINTS='127.0.0.1:9042'
ENV CASSANDRA_USER='cassandra'
ENV CASSANDRA_PWD='password'
ENV CASSANDRA_KEYSPACE='seshat'
ENV CASSANDRA_CL='ONE'
ENV CASSANDRA_CLUSTERNAME='datacenter1'

# MariaDB Connection Settings
ENV DB_HOST='localhost'
ENV DB_PORT='3306'
ENV DB_USER='root'
ENV DB_PASS='mysql'
ENV DB_NAME='seshat'

ENV DEP_PROVISION='true'

# commands
RUN adduser -D -s /bin/bash fineract
WORKDIR /home/fineract

RUN apk add --no-cache bash

COPY jars .
ADD run.sh run.sh
RUN chmod 755 run.sh && chown fineract:fineract run.sh
USER fineract

ENTRYPOINT ["./run.sh"]

EXPOSE 8761
