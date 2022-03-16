Maintenant nous allons voir la fonctionnalité d'_Auto-scale_ de Knative en action 🔎 :

Dans un autre terminal, observons l'activité des _pods_ et attendons jusqu'à qu'il n'y en ait plus aucun qui tourne (i.e. Ready at `0/2`):
```
kubectl get pod -l serving.knative.dev/service=opt-temps-attente-agences -w
```{{execute T2}}

Maintenant appelons le service de nouveau : 
```
http :$INGRESS_PORT/temps-attente/agence/4313 \
    Host:opt-temps-attente-agences.default.example.com
```{{execute T1}}
... et observons l'activité de la création des _pods_ dans le _Terminal 2_ : les conteneurs sont lancés de manière transparente !
