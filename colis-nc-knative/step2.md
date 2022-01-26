🚀 Deploy colis-nc on Knative 🧑‍🚀 :
```sh
kn service create colisnc-api \
--image optnc/colisnc-api:stable \
--port 8080 \
--revision-name=stable
```{{execute}}

🔦 _As you will see, once the service is ready, its url will appear. You can also retrieve it with `kn service describe colisnc-api -o url`{{execute}}_

☎️ Call the service :
```sh
curl -sS http://localhost:$INGRESS_PORT/colis/CA107308006SI \
    -H "Host: colisnc-api.default.example.com" | jq
```{{execute}}
