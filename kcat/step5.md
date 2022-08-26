Faire du _full_, ça rassure mais ce n'est pas toujours le plus efficace globalement : 
- cela consomme des resources machine
- ce n'est pas toujours évident à debugger

Le _delta_ peut-être une solution, à condition que ça reste simple.
👉🏼 Nous allons voir une des implémentations possible : comparaison du dernier fichier avec le nouveau

`+` Simulation d'une **création** dans nu nouveau fichier
```
clear
cp entreprises.csv nouveau.csv
cat <<EOF >> nouveau.csv
2022-08-26,1234567,NOUVELLE SOCIETE DE NOUVELLE,Société à responsabilité limitée,3832Z,Récupération de déchets triés,38,"Collecte, traitement et élimination des déchets ; récupération",E,"Production et distribution d'eau ; assainissement, gestion des déchets et dépollution",18,Nouméa,,province Sud,non,022-08-26
EOF
```{{execute}}

Pour détecter la nouvelle ligne, une solution est la commande `comm` + `sort` :
```
comm -23 <(sort nouveau.csv) <(sort entreprises.csv ) \
    | column -t -s, | cut -c -$COLUMNS 
```{{execute}}

`≠` Pour simuler le cas d'une **modification** :
```
sed -i 's/,OFFICE DES POSTES ET TELECOMMUNICATIONS,/,OPT,/g' nouveau.csv
```{{execute}}

Le même `grep` permet aussi de détecter les modifications :
Pour détecter la nouvelle ligne, on peut utiliser un `grep` :
```
comm -23 <(sort nouveau.csv) <(sort entreprises.csv ) \
    | column -t -s, | cut -c -$COLUMNS 
```{{execute}}

`-` Simulation d'une suppression :
```
sed -i /1000041/d nouveau.csv
```{{execute}}

Le cas d'une **suppression** est différent, pour ne pas confondre une modification et une suppression on séléection la colonne avec le RIDET: 
```
comm -13 \
    <(cut -d "," -f 2 nouveau.csv | sort) \
    <(cut -d "," -f 2 entreprises.csv | sort)
```{{execute}}