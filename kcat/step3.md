Intégration du CSV avec kafkacat 🚀 : 
```
clear
cat entreprises.csv \
   | tail +2 \
   | kafkacat -b localhost:9092 -P -t entreprises.csv
```{{execute}}
> <small>`-P` pour produire un message depuis le **stdin**</small>
> <small>`tail +2` pour ne pas envoyer l'entête</small>

Consommer les messages avec Kafkacat ⬇️ : 
```
kafkacat -b localhost:9092 -C -t entreprises.csv -o begin \
   | head \
   | column -t -s, | cut -c -$COLUMNS
```{{execute}}
> <small>`-C` pour **c**onsommer des messages</small>
> <small>`-o begin` pour se positionner au début du topic</small>

Compter les messages avec Kafkacat :
```
kafkacat -b localhost:9092 -C -t entreprises.csv -o begin -e \
   | wc -l
```{{execute}}
> <small>`-e` pour quiter lorsqu'il n'y à plus de messages</small>

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)

Spécifier une clé de message avec `jq` 🚀:
```
cat entreprises.csv \
   | tail +2 \
   | awk -F"," '{print $2 ";" $0}' \
   | kafkacat -b localhost:9092 -P -K ";" -t entreprises.csv
```{{execute}}
> <small>`-K` pour indiquer le séparateur entre la clé et la valeur du message</small>

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)