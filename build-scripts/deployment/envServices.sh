#!/usr/bin/env bash

# Eureka
EUREKA_URL='http://localhost:8761/eureka/'

# Java Settings
JAVA_OPTS="-Xmx768m"

# Cassandra Connection Settings
CASSANDRA_CONTACTPOINTS='127.0.0.1:9042'
CASSANDRA_USER='cassandra'
CASSANDRA_PWD='password'
CASSANDRA_KEYSPACE='seshat'
CASSANDRA_CL='ONE'
CASSANDRA_CLUSTERNAME='datacenter1'

# MariaDB Connection Settings
DB_HOST='localhost'
DB_PORT='3306'
DB_USER='root'
DB_PASS='mysql'
DB_NAME='seshat'

# ActiveMQ Settings
MQ_URL='tcp://localhost:61616'
MQ_USER='admin'
MQ_PASS='admin'


# services which we will start
service_directories=(
    "fineract-cn-identity"
    "fineract-cn-office"
    "fineract-cn-customer"
    "fineract-cn-accounting"
    "fineract-cn-deposit-account-management"
    "fineract-cn-rhythm"
)

service_ports=(
    "2021"
    "2023"
    "2024"
    "2025"
    "2027"
    "2022"
)