🚀 Déploiement de opt-temps-attente-agences-api dans Knative 🧑‍🚀 :
```
kn service create opt-temps-attente-agences \
    --image optnc/opt-temps-attente-agences-api:stable \
    --port 8080 \
    --revision-name=stable
```{{execute}}

Maintenant on se détend 😌, profitez-en pour prendre une pause, prendre un café ☕ parce que ça peut prendre un peu de temps !

🔦 _Comme vous le verez, une fois le service déploué, son url apparaît. Vous pouvez aussi la récupérer avec la commande `kn service describe opt-temps-attente-agences -o url`{{execute}}_

☎️ Call the service :
```
http :$INGRESS_PORT/temps-attente/agence/4313 \
    Host:opt-temps-attente-agences.default.example.com
```{{execute}}
