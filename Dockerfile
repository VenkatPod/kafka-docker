FROM ubuntu:18.04
ADD kafka_2.12-2.5.0.tgz /var/kafka/
ADD jdk1.8u251 /var/java/jdk1.8u251
ENV PATH="/var/java/jdk1.8u251/bin:$PATH"
ADD docker-entrypoint.sh /
ADD create-topic.sh /
ENV AUTO_CREATE_TOPICS=""

RUN ["chmod", "+x", "/docker-entrypoint.sh"]
RUN ["chmod", "+x", "/create-topic.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]
