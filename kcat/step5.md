Faire du _full_, ça rassure mais ce n'est pas toujours le plus efficace globalement : 
- cela consomme des resources machine
- ce n'est pas toujours évident à debugger

Le _delta_ peut-être une solution, à condition que ça reste simple.
👉🏼 Nous allons voir une des implémentations possible : comparaison du dernier fichier avec le nouveau

Pour commencer, on prépare un jeu de données : 
- sauvegarde du csv
```
cp entreprises.csv precedent.csv
```{{execute}}
- simulation d'une **création** d'entreprise sur le fichier actuel
```
cat <<EOF  >> entreprises.csv
2022-08-26,1234567,NOUVELLE SOCIETE DE NOUVELLE,Société à responsabilité limitée,3832Z,Récupération de déchets triés,38,"Collecte, traitement et élimination des déchets ; récupération",E,"Production et distribution d'eau ; assainissement, gestion des déchets et dépollution",18,Nouméa,,province Sud,non,022-08-26
EOF
```{{execute}}

Pour détecter la nouvelle ligne, on peut utiliser un `grep` :
```
grep -vFxf precedent.csv entreprises.csv
```{{execute}}

