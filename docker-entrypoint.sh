#!/bin/bash

set -e -x

/var/kafka/kafka_2.12-2.5.0/bin/zookeeper-server-start.sh /var/kafka/kafka_2.12-2.5.0/config/zookeeper.properties &

ZOOKEEPER_PID=$!

if [ ZOOKEEPER_PID != "" ]; then
  /create-topic.sh &
  /var/kafka/kafka_2.12-2.5.0/bin/kafka-server-start.sh /var/kafka/kafka_2.12-2.5.0/config/server.properties
fi
