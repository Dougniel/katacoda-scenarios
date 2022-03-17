Récupère les boutiques situées dans un rayon de `2000` mètres du point indiqué
par sa latitude `-22.302828` et longitude `166.448744`:

```
http GET :8080/api/partenaires \
    nearBy.lon=166.448744 \
    nearBy.lat=-22.302828 \
    nearBy.distance=2000
```{{execute}}
