👉 Lancement de l'application en version classique (c'est à dire compilé en _byte code_ et exécuté dans une JVM) qui tourne en Java 17

Tout d'abord, on récupère l'image Docker 🐳 : 
```sh
docker pull optnc/colisnc-api:latest-jvm
```{{execute}}

Maintenant, observons le temps de démarrage 🧐 : 
```sh
docker run --rm -p 8080:8080 optnc/colisnc-api:latest-jvm
```{{execute}}
Cela peut prende entre 10 et 20 secondes alors un peu de patience ♨️
Le temps de démarrage totale s'affichera à la dernière ligne (_JVM running for .._)

Pour mesurer la consommation mémoire ainsi que le temps de réponse, nous allons relancer l'application en _background_ (`-d`) :
```sh
docker run --rm -d -p 8080:8080 optnc/colisnc-api:latest-jvm
```{{execute}}

On mesure le temps de réponse ⏲️ avec la commutateur `--meta` de `httpie` :
```sh
http --meta :8080/colis/CA107308006SI
```{{execute}}
ℹ️ _Le tout premier appel est plus lent que les suivants puisque la JVM compile le code en natif à la volée (**J**ust **I**n **T**ime / JIT) ce qui n'est pas généralement génant, mais pour du _Serverless_ ça rajoute un délai suppémentaire en plus du démarrage de l'application._
👉 Relancer à nouveau cette commande et constatez la différence

Et maintenant on jette un oeil 👀 du côté de la consommation mémoire : 
```sh
docker stats --no-stream
```{{execute}}
_Il est à noter qu'il s'agit ici des paramètres par défaut de la JVM, il est possible de réduire la consommation mémoire avec le commutateur `-Xmx`, par défaut la contrainte est faible, du coup la JVM fait moins de libération mémoire pour favoriser le temps d'exécution'_.

