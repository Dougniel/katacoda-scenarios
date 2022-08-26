Installation de [`kafkacat`](https://github.com/edenhill/kcat), [`xslx2csv`](https://manpages.ubuntu.com/manpages/bionic/man1/xlsx2csv.1.html), [`jq`](https://github.com/stedolan/jq)..
```
apt install -y kafkacat xlsx2csv jq 
```{{execute}}

⚙️ Installation Kafka
```
docker run --rm -d --net host ubuntu/zookeeper:latest
docker run --rm -d --net host --name kafka ubuntu/kafka:latest
docker run --rm -d --net host -e KAFKA_BROKERS=localhost:9092 quay.io/cloudhut/kowl:latest
```{{execute}}

✔ Vérification : liste les topics et les serveurs Kafka (`-L`)
```
kafkacat -b localhost:9092 -L
```{{execute}}