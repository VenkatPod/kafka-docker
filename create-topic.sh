#!/bin/bash
while ! timeout 1 bash -c "echo > /dev/tcp/localhost/9092";
do sleep 1;
done


for topic in $(echo $AUTO_CREATE_TOPICS | sed "s/,/ /g")
do
    array=(${topic//:/ })
   /var/kafka/kafka_2.12-2.5.0/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions ${array[1]} --topic ${array[0]}
done

set +x
