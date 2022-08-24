Installation de kafkacat

```
apt install -y kafkacat
```{{execute}}

Installation Kafka

```
docker run --rm -d --net host ubuntu/zookeeper:latest
docker run --rm -d --net host ubuntu/kafka:latest
```{{execute}}

Vérification :
```
kafkacat -b localhost:9092 -L
```{{execute}}