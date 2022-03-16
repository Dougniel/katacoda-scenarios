🧰 First, install Knative CLI to manage easly Knative plugin on Kubernetes :
```
wget https://github.com/knative/client/releases/download/knative-v1.3.1/kn-linux-amd64
chmod +x kn-linux-amd64
mv kn-linux-amd64 /usr/local/bin/kn
kn version
```{{execute}}

🏗️ Installation des composants Knative pour les services & la couche réseau (Kourier) :
```
kubectl apply \
  -f https://github.com/knative/serving/releases/download/knative-v1.3.0/serving-crds.yaml
kubectl apply \
  -f https://github.com/knative/serving/releases/download/knative-v1.3.0/serving-core.yaml
kubectl apply \
  -f https://github.com/knative/net-kourier/releases/download/knative-v1.3.0/kourier.yaml
```{{execute}}  

🪛 Et pour finir, configuration de knative pour la couche réseau :
```
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'

INGRESS_PORT=$(kubectl --namespace kourier-system get service kourier)
```{{execute}}
🔦 C'est ce qui va peremettre à Knative d'intercepter les appels HTTP et de faire le nécessaire pour démarrer les applications
