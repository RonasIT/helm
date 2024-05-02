# laravel

![Version: 2.3.1](https://img.shields.io/badge/Version-2.3.1-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name laravel:

```console
$ helm repo add ronas https://ronasit.github.io/helm/
$ helm install laravel ronas/laravel
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mysql | ^9.14.1 |
| https://charts.bitnami.com/bitnami | postgresql | ^13.2.1 |
| https://charts.bitnami.com/bitnami | redis | ^18.2.0 |
| https://helm.soketi.app | soketi | ^2.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| cronjobs.concurrencyPolicy | string | `"Forbid"` |  |
| cronjobs.enabled | bool | `true` |  |
| cronjobs.resources.limits.memory | string | `"128Mi"` |  |
| cronjobs.resources.requests.cpu | string | `"50m"` |  |
| cronjobs.resources.requests.memory | string | `"128Mi"` |  |
| cronjobs.restartPolicy | string | `"Never"` |  |
| cronjobs.schedule | string | `"*/1 * * * *"` |  |
| cronjobs.schedulers[0].cmd | string | `"php artisan schedule:run || true"` |  |
| cronjobs.schedulers[0].name | string | `"default"` |  |
| cronjobs.startingDeadlineSeconds | int | `200` |  |
| cronjobs.successfulJobsHistoryLimit | int | `1` |  |
| extraEnvVars | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` | Oiverrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations."cert-manager.io/cluster-issuer" | string | `"cert-manager"` |  |
| ingress.annotations."certmanager.k8s.io/cluster-issuer" | string | `"cert-manager"` |  |
| ingress.annotations."ingress.kubernetes.io/rewrite-target" | string | `"/"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.annotations."nginx.ingress.kubernetes.io/server-snippet" | string | `"add_header X-Robots-Tag \"noindex, nofollow\";\n"` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"api.ronas.cloud"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls[0].hosts[0] | string | `"api.ronas.cloud"` |  |
| ingress.tls[0].secretName | string | `"api.ronas.cloud-tls"` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.path | string | `"/status"` |  |
| livenessProbe.port | string | `"http"` |  |
| logger.enabled | bool | `true` |  |
| logger.resources.limits.memory | string | `"64Mi"` |  |
| logger.resources.requests.cpu | string | `"50m"` |  |
| logger.resources.requests.memory | string | `"64Mi"` |  |
| migration.activeDeadlineSeconds | int | `180` |  |
| migration.annotations."helm.sh/hook" | string | `"post-install,pre-upgrade"` |  |
| migration.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation"` |  |
| migration.backoffLimit | int | `1` |  |
| migration.cmd | string | `"/mnt/scripts/migration.sh"` |  |
| migration.enabled | bool | `true` |  |
| migration.resources.limits.memory | string | `"128Mi"` |  |
| migration.resources.requests.cpu | string | `"50m"` |  |
| migration.resources.requests.memory | string | `"128Mi"` |  |
| mysql.auth.database | string | `"mydb"` |  |
| mysql.auth.existingSecret | string | `"mysql-credentials"` |  |
| mysql.auth.username | string | `"myuser"` |  |
| mysql.enabled | bool | `false` |  |
| mysql.primary.nodeSelector.default-node-pool | string | `"true"` |  |
| mysql.primary.persistence.size | string | `"1Gi"` |  |
| mysql.primary.resources.limits.memory | string | `"192Mi"` |  |
| mysql.primary.resources.requests.cpu | string | `"100m"` |  |
| mysql.primary.resources.requests.memory | string | `"192Mi"` |  |
| nameOverride | string | `""` |  |
| nodeSelector.default-node-pool | string | `"true"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.auth.database | string | `"pgdb"` |  |
| postgresql.auth.existingSecret | string | `"postgresql-credentials"` |  |
| postgresql.auth.username | string | `"pguser"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.primary.nodeSelector.default-node-pool | string | `"true"` |  |
| postgresql.primary.persistence.size | string | `"1Gi"` |  |
| postgresql.primary.resources.limits.memory | string | `"128Mi"` |  |
| postgresql.primary.resources.requests.cpu | string | `"100m"` |  |
| postgresql.primary.resources.requests.memory | string | `"128Mi"` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.path | string | `"/status"` |  |
| readinessProbe.port | string | `"http"` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.existingSecret | string | `"redis-credentials"` |  |
| redis.auth.existingSecretPasswordKey | string | `"password"` |  |
| redis.enabled | bool | `true` |  |
| redis.master.nodeSelector.default-node-pool | string | `"true"` |  |
| redis.master.persistence.size | string | `"1Gi"` |  |
| redis.master.resources.limits.memory | string | `"64Mi"` |  |
| redis.master.resources.requests.cpu | string | `"50m"` |  |
| redis.master.resources.requests.memory | string | `"64Mi"` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"192Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"192Mi"` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| soketi.app.extraEnv[0].name | string | `"SOKETI_DEBUG"` |  |
| soketi.app.extraEnv[0].value | string | `"1"` |  |
| soketi.app.extraEnv[1].name | string | `"SOKETI_DEFAULT_APP_ID"` |  |
| soketi.app.extraEnv[1].valueFrom.fieldRef.fieldPath | string | `"metadata.namespace"` |  |
| soketi.app.extraEnv[2].name | string | `"SOKETI_DEFAULT_APP_KEY"` |  |
| soketi.app.extraEnv[2].valueFrom.fieldRef.fieldPath | string | `"metadata.namespace"` |  |
| soketi.app.extraEnv[3].name | string | `"SOKETI_DEFAULT_APP_SECRET"` |  |
| soketi.app.extraEnv[3].valueFrom.fieldRef.fieldPath | string | `"metadata.namespace"` |  |
| soketi.app.resources.limits.memory | string | `"128Mi"` |  |
| soketi.app.resources.requests.cpu | string | `"100m"` |  |
| soketi.app.resources.requests.memory | string | `"128Mi"` |  |
| soketi.enabled | bool | `false` |  |
| soketi.nodeSelector.default-node-pool | string | `"true"` |  |
| soketi.service.port | int | `6001` |  |
| tolerations | list | `[]` |  |
| volumeMounts[0].mountPath | string | `"/mnt/gcs"` |  |
| volumeMounts[0].name | string | `"gcs"` |  |
| volumeMounts[0].readOnly | bool | `true` |  |
| volumeMounts[1].mountPath | string | `"/app/storage/logs"` |  |
| volumeMounts[1].name | string | `"logs"` |  |
| volumes[0].name | string | `"gcs"` |  |
| volumes[0].secret.optional | bool | `true` |  |
| volumes[0].secret.secretName | string | `"gcs-key"` |  |
| volumes[1].emptyDir | object | `{}` |  |
| volumes[1].name | string | `"logs"` |  |
| workers.autoscaling | object | `{"enabled":false,"maxReplicas":3,"minReplicas":1,"targetCPUUtilizationPercentage":60}` | Global workers autoscaling settings (can be overwritten in items) |
| workers.enabled | bool | `true` |  |
| workers.items | list | `[]` |  |
| workers.resources | object | `{"limits":{"limits":"50m","memory":"128Mi"},"requests":{"cpu":"25m","memory":"128Mi"}}` | Global workers resources (can be overwritten in items) |
