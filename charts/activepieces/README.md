# activepieces

![Version: 0.3.2](https://img.shields.io/badge/Version-0.3.2-informational?style=flat-square)

> **:exclamation: This Helm Chart is deprecated!**

## Installing the Chart

To install the chart with the release name activepieces:

```console
$ helm repo add ronas https://ronasit.github.io/helm/
$ helm install activepieces ronas/activepieces
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | ~12.2.2 |
| https://charts.bitnami.com/bitnami | redis | ~17.8.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| encryptionKey | string | `""` |  |
| extraEnvVars[0].name | string | `"AP_SIGN_UP_ENABLED"` |  |
| extraEnvVars[0].value | string | `"false"` |  |
| extraEnvVars[1].name | string | `"AP_FRONTEND_URL"` |  |
| extraEnvVars[1].value | string | `"http://localhost:8080/"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"activepieces/activepieces"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| jwtSecret | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.auth.database | string | `"activepieces"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.privileged | bool | `true` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
