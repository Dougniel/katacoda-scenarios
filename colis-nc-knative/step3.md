Now we will see Knative Severless feature in action 🔎 :

1. In other terminal, watch the pods and wait until no more still running :

```bash
kubectl get pod -l serving.knative.dev/service=colisnc-api -w
```{{execute T2}}

2. Call the service and see what appens : 
`curl -sS http://localhost:$INGRESS_PORT/colis/CA107308006SI -H "Host: colisnc-api.default.example.com" | jq`{{execute T1}}
