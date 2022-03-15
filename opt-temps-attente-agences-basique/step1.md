L'api est disponible sur [Dockerhub](https://hub.docker.com/repository/docker/optnc/opt-temps-attente-agences-api)

```shell
docker run -d --rm -p 8080:8080 optnc/opt-temps-attente-agences-api:latest
```{{execute}}

Voila, le service est up :

```
docker ps
```{{execute}}

Pour vérifier le status de l'API, via son endpoint dédié pour un monitoring plus aisé :

```
http :8080/actuator/health
```{{execute}}

Une fois l'application up, vous devez avoir la réponse suivante :

```
{
    "status": "UP"
}
```

Pour avoir tous les détails de l'api comme sa version :

```
http :8080/actuator/info
```{{execute}}
