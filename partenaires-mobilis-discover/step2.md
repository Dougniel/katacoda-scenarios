Pour démarrer l'API, télécharger et exécuter l'image publique
[`optnc/api-partenaires-mobilis`](docker run --rm -p 8080:8080 optnc/api-partenaires-mobilis:latest) avec la
commande ci-dessous:

```
docker run -d --name partenaires-mobilis -p 8080:8080 optnc/api-partenaires-mobilis:stable 
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
