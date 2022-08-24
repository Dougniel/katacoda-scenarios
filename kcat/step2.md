Fichier d'exemple : liste des entreprises de l'ISEE

```sh
curl https://www.isee.nc/component/phocadownload/category/10-ridet?download=2008:liste-d-entreprises-en-open-data -o entreprises.xslx
```

Conversion en csv :
```sh
apt install -y xlsx2csv
xlsx2csv entreprises.xlsx | tail +7 | head
```

