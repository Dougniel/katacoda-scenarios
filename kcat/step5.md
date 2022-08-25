Les date ne sont pas au format [ISO88601](https://fr.wikipedia.org/wiki/ISO_8601) 🤔

☝️ Cela peut être résolu avec la commande `sed` :
```
head entreprises.csv \
    | sed -E 's,([0-9]{2}).([0-9]{2}).([0-9]{4}),\3-\2-\1,g' \
    | batcat -l csv
```{{execute}}


Au final, la comamnde complête pour intégration dans kafka 🚀 : 
```
cat entreprises.csv \
    | sed -E 's,([0-9]{2}).([0-9]{2}).([0-9]{4}),\3-\2-\1,g' \
    | csv2json \
    | jq -jrc '.[] | (.RID7|tostring + ";"), ., "\n"' \
    | kafkacat -b localhost:9092 -P -K ";" -t entreprises.json
```{{execute}}

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.json)
