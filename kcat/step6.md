Nous avons maintenant un moyen complet 🧰 pour faire du _delta_, passons donc à la partie Kafka 🚀

`1#` Tout d'abord, on crée un topic en mode **compact** qui garantie de préserver sans limite les données **au moins les plus à jour** :
```
docker exec -ti kafka kafka-topics.sh \
    --bootstrap-server localhost:9092 \
    --create --topic entreprises \
    --config cleanup.policy=compact
```{{execute}}

On simule des données existantes par copie des messages du précédent topic avec Kafkcat 😉:
```
kafkacat -b localhost:9092 -C -K ";" -t entreprises.json -o begin -e \
    | kafkacat -b localhost:9092 -P -K ";" -t entreprises
```{{execute}}

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises)

Et enfin, on reprend le delta qu'on accorche aux mecanismes déjà vus pour envoyer dans Kafka ⚡️:
```
comm -23 \
    <(cat nouveau.csv | csv2json | sort) \
    <(cat entreprises.csv | csv2json | sort) \
    | jq -jrc '(.RID7|tostring + ";"), ., "\n"' \
    | kafkacat -b localhost:9092 -P -K ";" -t entreprises
```{{execute}}

Pour finir, la suppression est différente parce kafka attends un `null` en tant que valeur:
```
comm -13 <(cut -d "," -f 2 nouveau.csv | sort)  <(cut -d "," -f 2 entreprises.csv | sort) \
    | sed 's/$/;/g' \
    | kafkacat -b localhost:9092 -P -K ";" -t entreprises -Z
```{{execute}}
> <small>`-Z` pour consider comme `null` les chaînes de caractères vides</small>

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises)