# angular

![Version: 1.2.1](https://img.shields.io/badge/Version-1.2.1-informational?style=flat-square)

> **:exclamation: This Helm Chart is deprecated!**

## Installing the Chart

To install the chart with the release name angular:

```console
$ helm repo add ronas https://ronasit.github.io/helm/
$ helm install angular ronas/angular
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| extraEnvVars | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations."cert-manager.io/cluster-issuer" | string | `"cert-manager"` |  |
| ingress.annotations."certmanager.k8s.io/cluster-issuer" | string | `"cert-manager"` |  |
| ingress.annotations."ingress.kubernetes.io/rewrite-target" | string | `"/"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/from-to-www-redirect" | string | `"true"` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"www.angular.ronas.cloud"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls[0].hosts[0] | string | `"www.angular.ronas.cloud"` |  |
| ingress.tls[0].hosts[1] | string | `"angular.ronas.cloud"` |  |
| ingress.tls[0].secretName | string | `"www.angular.ronas.cloud-tls"` |  |
| nameOverride | string | `""` |  |
| nodeSelector.default-node-pool | string | `"true"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
