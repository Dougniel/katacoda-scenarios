Intégration du CSV avec kafkacat 🚀 : 
```
cat entreprises.csv \
   | tail +1
   | kafkacat -b localhost:9092 -P -t entreprises.csv
```{{execute}}
> ☝️ utilisation de l'option `-P` pour produire un message depuis le **stdin**

Consommer les messages avec Kafkacat ⬇️ : 
```
kafkacat -b localhost:9092 -C -t entreprises.csv -o begin \
   | batcat -r :5 -l csv
```{{execute}}_
> ☝️ utilisation de l'option `-C` pour **c**onsommer des messages, `-o begin` pour se positionner au début du topic

Compter les messages avec Kafkacat :
```
kafkacat -b localhost:9092 -C -t entreprises.csv -o begin -e | wc -l
```{{execute}}_
> ☝️ utilisation de l'option `-e` pour quiter lorsqu'il n'y à plus de messages

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)

Spécifier une clé de message avec `jq` 🚀:
```
cat entreprises.csv \
   | tail +1
   | awk -F"," '{print $2 ";" $0}' \
   | kafkacat -b localhost:9092 -P -K ";" -t entreprises.csv
```{{execute}}
> ☝️ utilisation de l'option `-K` pour indiquer le séparateur entre la clé et la valeur du message

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)