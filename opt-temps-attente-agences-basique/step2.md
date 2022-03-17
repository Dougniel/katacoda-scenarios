Accès à l'ensemble des agences du réseau OPT :
```shell
http :8080/temps-attente/agences
```{{execute}}

Récupérer les détails d'une agence en particulier :
```shell
http :8080/temps-attente/agence/4161
```{{execute}}

Avec l'utilitaire `jq` il est même très simple de récupérer la valeur du champ du temps d'attente dans un script shell 😉:
```shell
http :8080/temps-attente/agence/4313 | jq '.realMaxWaitingTimeMs'
```{{execute}}

Récupération de la liste des agences par rapport à une position géographique et un rayon 📍:
```shell
http GET :8080/temps-attente/agences \
    lon=166.4260482788086 \
    lat=-22.25097078275085 \
    distanceInMeters=3000
```{{execute}}

