First, install Kind to get a light Kubernetes environment environment:

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
```

And Knative CLI to manage easly Knative plugin on Kubernetes :
```bash
wget https://github.com/knative/client/releases/download/knative-v1.1.0/kn-linux-amd64
chmod +x kn-linux-amd64
mv kn-linux-amd64 /usr/local/bin/kn
kn version
```{{execute}}

Next download also Knative CLI's Quickstart plugin to setup the k8s cluster quickly :

```bash
wget https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-v1.1.0/kn-quickstart-linux-amd64
chmod +x kn-quickstart-linux-amd64
mv kn-quickstart-linux-amd64 /usr/local/bin/kn-quickstart
```{{execute}}

And finally, set up a local Knative cluster using Kind:
`kn quickstart kind`{{execute}}
