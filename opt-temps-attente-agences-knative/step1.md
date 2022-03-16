🧰 D'abord, l'installation du Knative CLI pour gérer de manière plus concise Kantive :
```
wget https://github.com/knative/client/releases/download/knative-v1.3.1/kn-linux-amd64
chmod +x kn-linux-amd64
mv kn-linux-amd64 /usr/local/bin/kn
kn version
```{{execute}}

🏗️ Installation des composants Knative pour les services & la couche réseau (Contour) :
```
kubectl apply \
  --filename https://github.com/knative/serving/releases/download/v0.26.0/serving-crds.yaml
kubectl apply \
  --filename https://github.com/knative/serving/releases/download/v0.26.0/serving-core.yaml
kubectl apply \
  --filename https://github.com/knative/net-contour/releases/download/v0.26.0/contour.yaml
kubectl apply \
  --filename https://github.com/knative/net-contour/releases/download/v0.26.0/net-contour.yaml
```{{execute}}  

🪛 Et pour finir, configuration de knative pour la couche réseau :
```
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"contour.ingress.networking.knative.dev"}}'

INGRESS_PORT=$(kubectl get svc envoy \
   --namespace contour-external \
   --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')
```{{execute}}
🔦 C'est ce qui va peremettre à Knative d'intercepter les appels HTTP et de faire le nécessaire pour démarrer les applications
