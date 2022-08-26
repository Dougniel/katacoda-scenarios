Faire du _full_, ça rassure mais ce n'est pas toujours le plus efficace globalement : 
- cela consomme des resources machine
- ce n'est pas toujours évident à debugger

Le _delta_ peut-être une solution, à condition que ça reste simple.
👉🏼 Nous allons voir une des implémentations possible : comparaison du dernier fichier avec le nouveau

Pour commencer, on prépare un jeu de données : 
- sauvegarde du csv
```
clear
cp entreprises.csv precedent.csv
```{{execute}}
- simulation d'une **création** d'entreprise sur le fichier actuel
```
cp entreprises.csv nouveau.csv
cat <<EOF >> nouveau.csv
2022-08-26,1234567,NOUVELLE SOCIETE DE NOUVELLE,Société à responsabilité limitée,3832Z,Récupération de déchets triés,38,"Collecte, traitement et élimination des déchets ; récupération",E,"Production et distribution d'eau ; assainissement, gestion des déchets et dépollution",18,Nouméa,,province Sud,non,022-08-26
EOF
```{{execute}}

Pour détecter la nouvelle ligne, une solution est la commande `comm` :
```
comm -23 nouveau.csv precedent.csv
```{{execute}}
> <small>si l'ordre des données chaneg d'un fichier à un autre : `grep -vFxf precedent.csv nouveau.csv`</small>

Pour simuler le cas d'une modification :
```
sed -i 's/,OFFICE DES POSTES ET TELECOMMUNICATIONS,/,OPT,/g' nouveau.csv
```{{execute}}

Le même `grep` permet aussi de détecter les modifications :
Pour détecter la nouvelle ligne, on peut utiliser un `grep` :
```
comm -23 nouveau.csv precedent.csv
```{{execute}}


