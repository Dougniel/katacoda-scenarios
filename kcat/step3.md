Installation de [miller](https://github.com/johnkerl/miller), l'outil ligne de commande pour manipuler les CSV et de [jq](https://stedolan.github.io/jq/) : 
```
apt install -y miller jq
```{{execute}}

Conversion en JSON avec miller : 
```
xlsx2csv entreprises.xlsx | tail +7 | mlr --icsv --ojson head | jq
```{{execute}}

Intégration du CSV avec kafkacat : 
```
xlsx2csv entreprises.xlsx  | tail +7 | mlr --icsv --ojson cat | kafkacat -b localhost:9092 -P -t entreprises.json
```{{execute}}

Visualisation sur Kowl : {{TRAFFIC_HOST1_8080}}/topics/entreprises.json
