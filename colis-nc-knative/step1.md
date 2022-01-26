1. First, install Knative CLI to manage easly Knative plugin on Kubernetes 🧰 :
   
```bash
wget https://github.com/knative/client/releases/download/knative-v1.1.0/kn-linux-amd64
chmod +x kn-linux-amd64
mv kn-linux-amd64 /usr/local/bin/kn
kn version
```{{execute}}

1. Next install Knative Serving's core components & networking layer 🏗️ :

```bash
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.19.0/serving-crds.yaml
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.19.0/serving-core.yaml
kubectl apply --filename https://github.com/knative/net-contour/releases/download/v0.19.0/contour.yaml
kubectl apply --filename https://github.com/knative/net-contour/releases/download/v0.19.0/net-contour.yaml
```{{execute}}  

3. Finally, configure Knative Serving to use Contour by default and get port 👍 :

```bash
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"contour.ingress.networking.knative.dev"}}'

INGRESS_PORT=$(kubectl get svc envoy --namespace contour-external --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')
```{{execute}}
