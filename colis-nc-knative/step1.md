First, install Knative CLI :

```bash
wget https://github.com/knative/client/releases/download/knative-v1.1.0/kn-linux-amd64
chmod +x kn-linux-amd64
mv kn-linux-amd64 /usr/local/bin/kn
kn version
```{{execute}}

Next download also Knative CLI's Quickstart plugin to setup the k8s cluster easily :

```bash
wget https://github.com/knative-sandbox/kn-plugin-quickstart/releases/download/knative-v1.1.0/kn-quickstart-linux-amd64
chmod +x kn-quickstart-linux-amd64
mv kn-quickstart-linux-amd64 /usr/local/bin/kn-quickstart
```{{execute}}

Set up a local Knative cluster using Minikube:
`kn quickstart minikube`{{execute}}
