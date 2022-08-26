Script de conversion en JSON (via Python) : 
```
clear
alias csv2json="python -c \
'import csv, json, sys; 
print(json.dumps([dict(r) for r in csv.DictReader(sys.stdin)]))'"
```{{execute}}

Essai à blanc 🔫 :
```
head entreprises.csv | csv2json | jq
```{{execute}}

Intégration du JSON avec RIDET en tant que clé (via `jq`) 🚀 : 
```
cat entreprises.csv \
    | csv2json \
    | jq -jrc '.[] | (.RID7|tostring + ";"), ., "\n"' \
    | kafkacat -b localhost:9092 -P -K ";" -t entreprises.json
```{{execute}}

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.json)
