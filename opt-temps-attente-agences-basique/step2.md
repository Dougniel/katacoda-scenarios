Accès à l'ensemble des agences du réseau OPT :
```shell
http :8080/temps-attente/agences
```{{execute}}

Récupérer les détails d'une agence en particulier :
```shell
http :8080/temps-attente/agence/4161
```{{execute}}

Avec l'utilitaire `jq` il est même très simple de récupérer une information dans un script shell 😉:
```shell
http :8080/temps-attente/agence/4161 | jq '.idAgence'
```{{execute}}

Récupération de la liste des agences par rapport à une position géographique et un rayon 📍:
```shell
http ':8080/temps-attente/agences?lon=166.4260482788086&lat=-22.25097078275085&distanceInMeters=3000'
```{{execute}}

