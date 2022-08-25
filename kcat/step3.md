Intégration du CSV avec kafkacat 🚀 : 
```
cat entreprises.csv | kafkacat -b localhost:9092 -P -t entreprises.csv
```{{execute}}
_☝️ utilisation de l'option `-P` pour produire un message depuis le **stdin**_

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)

Compter les messages avec Kafkacat 🧐 :
```
kafkacat -b localhost:9092 -C -t entreprises.json -o begin -e | wc -l
```{{execute}}_

Utilisation de RID7 comme clé de message [^1] 🚀 🚀:
```
cat entreprises.csv \
   | awk -F"," '{print $2 ";" $0}' \
   | kafkacat -b localhost:9092 -P -K ";" -t entreprises.csv
```{{execute}}
_☝️ utilisation de l'option `-K` pour indiquer le séparateur entre la clé et la valeur du message_

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)

[^1]: _Clé de message utile notamment dans les topics qui sont en **compact**_