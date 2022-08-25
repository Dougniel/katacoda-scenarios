Installation de [miller](https://github.com/johnkerl/miller), l'outil ligne de commande pour manipuler les CSV : 
```
apt install -y miller
```{{execute}}

Conversion en JSON avec miller : 
```
xlsx2csv entreprises.xlsx | tail +7 | mlr --icsv json
```{{execute}}
