Fichier d'exemple : liste des entreprises de l'ISEE

```
curl https://www.isee.nc/component/phocadownload/category/10-ridet?download=2008:liste-d-entreprises-en-open-data -o entreprises.xlsx
```{{execute}}

C'est un fichier Excel, il faut donc le transformer en CSV : [`xslx2csv`](https://manpages.ubuntu.com/manpages/bionic/man1/xlsx2csv.1.html) :
```
xlsx2csv entreprises.xlsx | tail +7 > entreprises.csv
```{{execute}}

Visu des 5 première lignes 🧐 :
```
batcat -r :5 entreprises.csv
```{{execute}}
