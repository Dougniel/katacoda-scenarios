Now we will see Knative Severless feature in action 🔎 :

In other terminal, watch the pods and wait until no more still running (i.e. `0/2`):
```bash
kubectl get pod -l serving.knative.dev/service=colisnc-api -w
```{{execute HOST1}}

Now, call the service again : 
```sh
curl -sS http://localhost:$INGRESS_PORT/colis/CA107308006SI \
    -H "Host: colisnc-api.default.example.com" | jq
```{{execute HOST2}}
... and see what appens 
