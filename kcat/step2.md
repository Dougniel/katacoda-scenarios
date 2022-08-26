⬇️ Fichier d'exemple : récupération de la liste des entreprises de l'ISEE 🏢
```
curl https://www.isee.nc/component/phocadownload/category/10-ridet?download=2008:liste-d-entreprises-en-open-data \
    -o entreprises.xlsx
```{{execute}}

C'est un fichier Excel donc on le converti en CSV avec [`xslx2csv`](https://manpages.ubuntu.com/manpages/bionic/man1/xlsx2csv.1.html) par exemple 🧐 :
```
xlsx2csv entreprises.xlsx  | head
```{{execute}}

Sans l'entête cette fois (via un `tail`) et en plus lisible (via `colums` & `cut`) :
```
xlsx2csv entreprises.xlsx \
    | tail +7 \
    | head \
    | column -t -s, | cut -c -$COLUMNS
```{{execute}}

Les date ne sont pas au format [ISO88601](https://fr.wikipedia.org/wiki/ISO_8601) 🤔.. cela peut être résolu avec une expression `sed` :
```
xlsx2csv entreprises.xlsx \
    | tail +7 \
    | head \
    | sed -E 's,([0-9]{2}).([0-9]{2}).([0-9]{4}),\3-\2-\1,g' \
    | column -t -s, | cut -c -$COLUMNS
```{{execute}}

💾 Enfin, sauvegarde dans un fichier pour simplifier les commandes à venir :
```
xlsx2csv entreprises.xlsx \
    | tail +7 \
    | sed -E 's,([0-9]{2}).([0-9]{2}).([0-9]{4}),\3-\2-\1,g' \
    > entreprises.csv
```{{execute}}