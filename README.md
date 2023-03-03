# Helm Chart Repository

This repository contains a collection of Helm charts developed by Ronas IT, a software development company that provides custom software development services to a wide range of industries. The Helm charts in this repository are designed to simplify the deployment of various applications on Kubernetes.

To use this repository, you will need to have Helm installed on your Kubernetes cluster. Once Helm is installed, you can add this repository to your local Helm installation using the following command:

```sh
helm repo add ronasit https://ronasit.github.io/helm/
```

After adding the repository, you can search for available charts using the helm search command:

```sh
helm search repo ronasit
```

This will display a list of available charts in the repository.

To install a chart, you can use the helm install command:

```sh
helm install my-release ronasit/<chart-name>
```

Replace <chart-name> with the name of the chart you want to install. You can also provide additional configuration options using a values file or command line arguments.

Each chart in this repository has its own README file that provides detailed information about how to use the chart and its available configuration options.

## Contributing

We welcome contributions to this repository! If you have developed a Helm chart that you would like to share, please feel free to submit a pull request. Before submitting a pull request, please ensure that your chart meets the following requirements:

The chart must be compatible with Kubernetes.
The chart must follow best practices for Helm chart development.
The chart must include a README file that provides clear instructions for using the chart.
