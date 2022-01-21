1. Deploy colis-nc 🚀 on Knative 🧑‍🚀 :
```sh
kn service create colisnc-api \
--image optnc/colisnc-api:stable \
--port 8080 \
--revision-name=stable
```{{execute}}

🔦 _As you will see, once the service is ready, its url will appear. You can also retrieve it with `kn service describe colis-api -o url`_

2. Call the service 👍 : 
`curl -sS  http://localhost:$INGRESS_PORT/colis/CA107308006SI -H "Host: $(kn service describe colis-api -o url)" | jq`{{execute}}
