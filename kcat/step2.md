⬇️ Fichier d'exemple : récupération de la liste des entreprises de l'ISEE 🏢
```
curl https://www.isee.nc/component/phocadownload/category/10-ridet?download=2008:liste-d-entreprises-en-open-data \
    -o entreprises.xlsx
```{{execute}}

C'est un fichier Excel, il faut donc le transformer en CSV : [`xslx2csv`](https://manpages.ubuntu.com/manpages/bionic/man1/xlsx2csv.1.html) :

On jette un oeil au début du CSV 🧐 :
```
xlsx2csv entreprises.xlsx \
    | head \
    | column -t -s, | cut -c -$COLUMNS
```{{execute}}

Sans l'entête cette fois (via un `tail`) :
```
xlsx2csv entreprises.xlsx \
    | tail +7 \
    | head \
    | column -t -s, | cut -c -$COLUMNS
```{{execute}}

Les date ne sont pas au format [ISO88601](https://fr.wikipedia.org/wiki/ISO_8601) 🤔

☝️ Cela peut être résolu avec la commande `sed` :
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