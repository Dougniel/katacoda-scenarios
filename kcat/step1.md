Installation de kafkacat

```sh
apt install -y kafkacat
```

Installation Kafka

```sh
docker run --rm -d --net host ubuntu/zookeeper:latest
docker run --rm -d --net host ubuntu/kafka:latest
```

Vérification :
```sh
kafkacat -b localhost:9092 -L
```