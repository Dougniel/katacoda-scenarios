Dans ce scénario, nous allons expérimeter :

- L'installation de [Knative](https://knative.dev/docs/) dans Kubernetes ☸
- 🚀 Déploiement de l'API des temps d'attente aux agences OPT dans un cluster Knative
- Appel de l'API ⏳ en constatant le comportement en _Serverless_

# 🚀 Qu'est-ce que Knative ?

[Knative](https://knative.dev/docs/) est une plateforme Kubernetes permettant de déployer des images Docker à la sauce _Serverless_ facilement (plus d'infos [ici](https://www.katacoda.com/swapb/scenarios/knative-intro)).

# 📦 Qu'est-ce que l'API des temps d'attente aux agences OPT

[opt-temps-attente-agences-api](https://github.com/opt-nc/opt-temps-attente-agences-api) est une API REST permettant d'accéder aux temps d'attentes en cours dans les agences OPT en 🇫🇷 Nouvelle-Calédonie 🏖️

