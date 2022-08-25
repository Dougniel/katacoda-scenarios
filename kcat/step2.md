Fichier d'exemple : liste des entreprises de l'ISEE

```
curl https://www.isee.nc/component/phocadownload/category/10-ridet?download=2008:liste-d-entreprises-en-open-data -o entreprises.xlsx
```{{execute}}

Le fichier est un fichier Excel, il faut donc le transformer en CSV : [`xslx2csv`](https://manpages.ubuntu.com/manpages/bionic/man1/xlsx2csv.1.html) :
```
apt install -y xlsx2csv && clear
```{{execute}}

Conversion en csv :
```
xlsx2csv entreprises.xlsx | tail +7 > entreprises.csv
```{{execute}}

Intégration du CSV avec kafkacat : 
```
cat entreprises.csv | kafkacat -b localhost:9092 -P -t entreprises.csv
```{{execute}}
_☝️ utilisation de l'option `-P` pour produire un message depuis le **stdin**_

Utilisation de RID7 comme clé de message (utile notamment dans les topics qui sont en _COMPACT_):
```
cat entreprises.csv \
   | awk -F"," '{print $2 ";" $0}' \
   | kafkacat -b localhost:9092 -P -K ";" -t entreprises.csv
```{{execute}}
_☝️ utilisation de l'option `-K` pour indiquer le séparateur entre la clé et la valeur du message_

👉🏼 [Voir sur Kowl 🤩]({{TRAFFIC_HOST1_8080}}/topics/entreprises.csv)
