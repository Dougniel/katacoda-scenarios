Deploy colis-nc :
```sh
kn service create colisnc-api \
--image optnc/colisnc-api:stable \
--port 8080 \
--revision-name=stable
```{{execute}}

Get URL of the service :
`kn service describe colisnc-api -o url`{{execute}}

Call the service : 
`curl -sS  $(kn service describe colisnc-api -o url)/colis/CA107308006SI | jq`{{execute}}
