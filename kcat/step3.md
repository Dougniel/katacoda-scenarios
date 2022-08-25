
Intégration du CSV avec kafkacat 🚀 : 
```
cat entreprises.csv | kafkacat -b localhost:9092 -P -t entreprises.csv
```{{execute}}
_☝️ utilisation de l'option `-P` pour produire un message depuis le **stdin**_

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)

Utilisation de RID7 comme clé de message (utile notamment dans les topics qui sont en _COMPACT_) 🚀 🚀 :
```
cat entreprises.csv \
   | awk -F"," '{print $2 ";" $0}' \
   | kafkacat -b localhost:9092 -P -K ";" -t entreprises.csv
```{{execute}}
_☝️ utilisation de l'option `-K` pour indiquer le séparateur entre la clé et la valeur du message_

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)
