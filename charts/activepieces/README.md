# ActivePieces Helm Chart

This repository contains a Helm chart to deploy the https://www.activepieces.com web application to a Kubernetes cluster.

## Prerequisites

Before deploying the ActivePieces Helm chart, make sure you have:

- A Kubernetes cluster running version 1.16 or later
- Helm installed on your local machine

## Installing the Chart

To install the ActivePieces Helm chart, run this commands:

```sh
helm repo add ronasit https://ronasit.github.io/helm/
helm install activepieces ronasit/activepieces
```

This command will deploy the ActivePieces web application to your Kubernetes cluster using the default configuration values.

If you want to customize the deployment, you can pass a YAML file with your configuration values as follows:

```sh
helm install activepieces ronasit/activepieces -f values.yaml
```

Replace values.yaml with the path to your configuration file.

4. Wait for the deployment to complete. You can monitor the deployment status by running:

```sh
kubectl get pods -l app=activepieces
```

5. Once the deployment is complete, you can access the ActivePieces web application by running:

```sh
kubectl port-forward svc/activepieces 8080:80
```

This command will forward traffic from your local machine to the ActivePieces service running in the Kubernetes cluster.

Open a web browser and go to http://localhost:8080 to access the ActivePieces web application.

## Uninstalling the Chart

To uninstall the ActivePieces Helm chart, run the following command:

```sh
helm uninstall activepieces
```

This command will delete all resources created by the chart, including the Kubernetes deployment, service, and ingress (if created).
