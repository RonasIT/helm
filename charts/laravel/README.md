# laravel

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name laravel:

```console
$ helm repo add ronas https://ronasit.github.io/helm/
$ helm install laravel ronas/laravel
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/cloudpirates | mariadb | 0.16.5 |
| oci://registry-1.docker.io/cloudpirates | postgresql(postgres) | 0.19.5 |
| oci://registry-1.docker.io/cloudpirates | redis | 0.30.4 |

> **Upgrading from 2.x?** The PostgreSQL/Redis/MySQL subcharts moved from Bitnami to
> CloudPirates (breaking). See [MIGRATION.md](./MIGRATION.md) for value remapping, service
> name changes, and the PostgreSQL 17 → 18 data migration.

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
| cronjobs.resourcesPreset | string | `"nano"` |  |
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
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.buffering.enabled | bool | `true` |  |
| ingress.buffering.maxRequestBodyBytes | int | `1048576000` |  |
| ingress.buffering.maxResponseBodyBytes | int | `1048576000` |  |
| ingress.enabled | bool | `true` |  |
| ingress.entryPoints[0] | string | `"websecure"` |  |
| ingress.forwardedHeaders.host | string | `""` |  |
| ingress.forwardedHeaders.port | string | `"443"` |  |
| ingress.forwardedHeaders.proto | string | `"https"` |  |
| ingress.hosts[0].host | string | `"api.ronas.cloud"` |  |
| ingress.hosts[0].paths[0] | object | `{"path":"/"}` | Path configuration. Each path can optionally specify a custom service and port. If service is not specified, it defaults to the main service (laravel.fullname). If port is not specified, it defaults to service.port. |
| ingress.ipAllowList.enabled | bool | `false` |  |
| ingress.ipAllowList.sourceRange | list | `[]` | List of allowed IP ranges in CIDR notation. Example: ['192.168.1.0/24'] WARNING: '0.0.0.0/0' allows all traffic and should be replaced with specific IP ranges for security. |
| ingress.noindex.enabled | bool | `true` |  |
| ingress.noindex.value | string | `"noindex, nofollow"` |  |
| ingress.tls.certResolver | string | `"letsencrypt"` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.path | string | `"/status"` |  |
| livenessProbe.port | string | `"http"` |  |
| logger.enabled | bool | `true` |  |
| logger.resourcesPreset | string | `"nano"` |  |
| mariadb.auth.database | string | `"mydb"` |  |
| mariadb.auth.existingSecret | string | `"mariadb-credentials"` |  |
| mariadb.auth.username | string | `"myuser"` |  |
| mariadb.enabled | bool | `false` |  |
| mariadb.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| mariadb.nodeSelector.default-node-pool | string | `"true"` |  |
| mariadb.persistence.size | string | `"1Gi"` |  |
| mariadb.resources.limits.memory | string | `"128Mi"` |  |
| mariadb.resources.requests.cpu | string | `"50m"` |  |
| mariadb.resources.requests.memory | string | `"128Mi"` |  |
| migration.activeDeadlineSeconds | int | `180` |  |
| migration.annotations."helm.sh/hook" | string | `"post-install,pre-upgrade"` |  |
| migration.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation"` |  |
| migration.backoffLimit | int | `1` |  |
| migration.cmd | string | `"/mnt/scripts/migration.sh"` |  |
| migration.enabled | bool | `true` |  |
| migration.resourcesPreset | string | `"nano"` |  |
| nameOverride | string | `""` |  |
| nodeSelector.default-node-pool | string | `"true"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.auth.existingSecret | string | `"postgresql-credentials"` |  |
| postgresql.auth.secretKeys.adminPasswordKey | string | `"postgres-password"` |  |
| postgresql.customUser.database | string | `"pgdb"` |  |
| postgresql.customUser.existingSecret | string | `"postgresql-credentials"` |  |
| postgresql.customUser.name | string | `"pguser"` |  |
| postgresql.customUser.secretKeys.database | string | `""` |  |
| postgresql.customUser.secretKeys.name | string | `""` |  |
| postgresql.customUser.secretKeys.password | string | `"password"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| postgresql.nodeSelector.default-node-pool | string | `"true"` |  |
| postgresql.persistence.size | string | `"1Gi"` |  |
| postgresql.resources.limits.memory | string | `"128Mi"` |  |
| postgresql.resources.requests.cpu | string | `"50m"` |  |
| postgresql.resources.requests.memory | string | `"128Mi"` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.path | string | `"/status"` |  |
| readinessProbe.port | string | `"http"` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.existingSecret | string | `"redis-credentials"` |  |
| redis.auth.existingSecretPasswordKey | string | `"password"` |  |
| redis.enabled | bool | `true` |  |
| redis.image.pullPolicy | string | `"IfNotPresent"` |  |
| redis.nodeSelector.default-node-pool | string | `"true"` |  |
| redis.persistence.size | string | `"1Gi"` |  |
| redis.resources.limits.memory | string | `"128Mi"` |  |
| redis.resources.requests.cpu | string | `"50m"` |  |
| redis.resources.requests.memory | string | `"128Mi"` |  |
| replicaCount | int | `1` |  |
| resourcesPreset | string | `"nano"` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
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
| workers.resourcesPreset | string | `"nano"` | Global workers resources (can be overwritten in items) |
