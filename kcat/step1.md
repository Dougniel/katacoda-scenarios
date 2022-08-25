Installation de kafkacat

```
apt install -y kafkacat
```{{execute}}

Installation Kafka

```
docker run --rm -d --net host ubuntu/zookeeper:latest
docker run --rm -d --net host ubuntu/kafka:latest
docker run --rm -d --net host -e KAFKA_BROKERS=localhost:9092 quay.io/cloudhut/kowl:latest
```{{execute}}

Vérification :
```
kafkacat -b localhost:9092 -L
```{{execute}}
_ℹ️ Kafkacat à quelques fonctions d'aministration basiques, pour des fonctions plus avancées 👉🏼 [kafkactl](https://github.com/deviceinsight/kafkactl)
