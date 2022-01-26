Now we will see Knative Severless feature in action 🔎 :

In other terminal, watch the pods and wait until no more still running (i.e. Ready at `0/2`):
```bash
kubectl get pod -l serving.knative.dev/service=colisnc-api -w
```{{execute T2}}

Now, call the service : 
```sh
curl -sS http://localhost:$INGRESS_PORT/colis/CA107308006SI \
    -H "Host: colisnc-api.default.example.com" | jq
```{{execute T1}}
... and see what happens on _Terminal 2_ : containers are started _on demand_ seamlessly !
