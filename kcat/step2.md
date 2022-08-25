Fichier d'exemple : liste des entreprises de l'ISEE

```
curl https://www.isee.nc/component/phocadownload/category/10-ridet?download=2008:liste-d-entreprises-en-open-data -o entreprises.xlsx
```{{execute}}

Installation de l'outil [`xslx2csv`](https://manpages.ubuntu.com/manpages/bionic/man1/xlsx2csv.1.html) :
```
apt install -y xlsx2csv && clear
```{{execute}}

Conversion en csv :
```
xlsx2csv entreprises.xlsx | tail +7 | head
```{{execute}}

Intégration du CSV avec kafkacat : 
```
xlsx2csv entreprises.xlsx | tail +8 | kafkacat -b localhost:9092 -P -t entreprises.csv
```{{execute}}

Visualisation sur Kowl : {{TRAFFIC_HOST1_8080}}/topics/entreprises.csv
