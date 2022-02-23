👉 C'est au tour de la version Spring Native 🥳

On récupère l'image Docker 🐬 : 
```sh
docker pull optnc/colisnc-api:latest
```{{execute}}

Maintenant, observons le temps de démarrage 🧐 : 
```sh
docker run --rm -p 8081:8080 optnc/colisnc-api:latest
```{{execute}}
⏩ Oui c'est déjà démarré en moins d'une seconde 😎
_ℹ️ Ce gain est liée à la compilation native mais aussi et surtout à d'autres optimisations comme le fait de ne garder que le code qui est réellement utilisée et qu'il n'y ait plus d'instropection, tout ceci est d'autant plus important sur des applications Spring Boot_

Passons à la mesurer de la consommation mémoire et du temps de réponse en relançant l'application en _background_ (`-d`) :
```sh
docker run --rm -d -p 8081:8080 optnc/colisnc-api:latest
```{{execute interrupt}}

On mesure le temps de réponse ⏲️ avec la commutateur `--meta` de `httpie` :
```sh
http --meta :8081/colis/CA107308006SI
```{{execute}}
_ℹ️ On peut constater que cette fois-ci, le premier appel prend sensiblement le même temps que les suivants, la raison est que cette fois-ci la compilation est dite "en avance de phase" ([**A**head **O**f **T**ime / AOT](https://www.graalvm.org/native-image/)) par opposition au JIT de la JVM_

Et maintenant on jette un oeil 👀 du côté de la consommation mémoire : 
```sh
docker stats --no-stream
```{{execute}}
_ℹ️ Même si la mémoire est gérée d'une manière similaire que dans une JVM (Garbage Collector), le runtime Java intégré dans le binaire est tout de même plus léger ce qui explique la consommation mémoire amoindrie_ 

En bonus 🎖️, comparons la taille des images Docker entre la version native et la version classique (image taggée en `latest-jvm`) :
```sh
docker images | grep optnc/colisnc-api
```{{execute}}
_ℹ️ Ici aussi il y a un gain remarquable, notamment parce que lors de la compilation en natif, le code non exécuté n'est pas intégré dans le binaire_
