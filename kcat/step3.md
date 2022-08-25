Conversion en JSON (via Python) : 
```
alias csv2json="python -c 'import csv, json, sys; print(json.dumps([dict(r) for r in csv.DictReader(sys.stdin)]))'"
head entreprises.csv | csv2json | jq | head
```{{execute}}

Intégration du CSV avec kafkacat : 
```
cat entreprises.csv | csv2json | jq -jrc '.[] | (.RID7|tostring+";"),.,"\n"' | kafkacat -b localhost:9092 -P -K ";" -t entreprises.json
```{{execute}}

Visualisation sur Kowl : {{TRAFFIC_HOST1_8080}}/topics/entreprises.json
