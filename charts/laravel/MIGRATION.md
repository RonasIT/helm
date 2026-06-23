# Migrating laravel chart 2.x → 3.0.0 (Bitnami → CloudPirates subcharts)

The PostgreSQL, Redis and MySQL subcharts moved off the **Bitnami** catalog (shut down
2025-08-28, public images removed 2025-09-29) to **CloudPirates** charts, which run the
**Docker Official Images** (`docker.io/postgres:18`, `docker.io/redis:8`,
`docker.io/mariadb:12`). This is a forced, breaking migration — not a cosmetic bump.

| Dependency | Before (Bitnami) | After (CloudPirates) | Engine |
|---|---|---|---|
| postgresql | `postgresql ^16.6.3` | `postgres 0.19.5` (aliased `postgresql`) | PostgreSQL **17 → 18** |
| redis | `redis ^20.13.2` | `redis 0.30.4` | Redis **7 → 8** |
| mysql | `mysql ^11.1.17` | `mariadb 0.16.5` | MySQL → **MariaDB 12** |

## 1. Service name (host) changes — update your app env

The app's `DB_HOST` / `REDIS_HOST` are set by **you** (consumer `extraEnvVars`), not by this
chart. After upgrading:

| | Before | After | Action |
|---|---|---|---|
| PostgreSQL | `<release>-postgresql` | `<release>-postgresql` | **unchanged** (kept via dependency alias) |
| Redis | `<release>-redis-master` | `<release>-redis` | **update `REDIS_HOST`** |
| MariaDB | `<release>-mysql` | `<release>-mariadb` | **update `DB_HOST`** (if you used mysql) |

## 2. values.yaml remapping

The CloudPirates value schemas differ from Bitnami. Re-map your overrides:

### postgresql
```diff
 postgresql:
   enabled: true
-  image:
-    tag: 17.4
-  auth:
-    database: 'pgdb'
-    username: 'pguser'
-    existingSecret: 'postgresql-credentials'
-  primary:
-    persistence:
-      size: 1Gi
-    resourcesPreset: nano
-    nodeSelector:
-      default-node-pool: 'true'
+  # auth.* = the PostgreSQL SUPERUSER; customUser.* = the application user/db
+  auth:
+    existingSecret: 'postgresql-credentials'
+    secretKeys:
+      adminPasswordKey: 'postgres-password'
+  customUser:
+    name: 'pguser'
+    database: 'pgdb'
+    existingSecret: 'postgresql-credentials'
+    secretKeys:
+      name: ''            # use literal customUser.name (secret has no such key)
+      database: ''        # use literal customUser.database
+      password: 'password'
+  persistence:
+    size: 1Gi             # was primary.persistence.size; default is now 8Gi
+  nodeSelector:           # was primary.nodeSelector
+    default-node-pool: 'true'
+  resources:              # was primary.resourcesPreset (no preset field exists now)
+    requests: { cpu: 50m, memory: 128Mi }
+    limits:   { memory: 128Mi }
```
Key points: Bitnami's single `auth.{username,database,password}` is split — `auth.*` is the
**superuser** only (leave it default), and the **app account** (`pguser`/`pgdb`) lives under
`customUser.*`. The chart-managed `postgresql-credentials` secret is unchanged (keys
`postgres-password` + `password`).

### redis
```diff
 redis:
   enabled: true
   architecture: 'standalone'
-  image:
-    tag: 7.4
   auth:
     existingSecret: 'redis-credentials'
     existingSecretPasswordKey: 'password'   # default is 'redis-password' — keep this override
-  master:
-    persistence:
-      size: 1Gi
-    resourcesPreset: nano
-    nodeSelector:
-      default-node-pool: 'true'
+  persistence:            # was master.persistence
+    size: 1Gi
+  nodeSelector:           # was master.nodeSelector
+    default-node-pool: 'true'
+  resources:              # was master.resourcesPreset
+    requests: { cpu: 50m, memory: 128Mi }
+    limits:   { memory: 128Mi }
```

### mysql → mariadb
The `mysql:` values key becomes `mariadb:` and the secret becomes `mariadb-credentials`
(keys `mariadb-root-password`, `mariadb-password`; the Bitnami `mysql-replication-password`
is gone — single-node MariaDB has no replication password).
```diff
-mysql:
+mariadb:
   enabled: false
   auth:
     database: 'mydb'
     username: 'myuser'
-    existingSecret: 'mysql-credentials'
-  primary:
-    persistence:
-      size: 1Gi
-    resourcesPreset: nano
-    nodeSelector:
-      default-node-pool: 'true'
+    existingSecret: 'mariadb-credentials'
+  persistence:
+    size: 1Gi
+  nodeSelector:
+    default-node-pool: 'true'
+  resources:
+    requests: { cpu: 50m, memory: 128Mi }
+    limits:   { memory: 128Mi }
```
> **MySQL → MariaDB is an engine change, not a drop-in for existing MySQL *data*.** MariaDB 12
> is wire-compatible for Laravel/PDO, but an existing MySQL database needs a logical
> dump/restore (`mysqldump`), not a PVC reuse. If you require real MySQL semantics, override
> the dependency with a MySQL chart instead.

## 3. Data migration (PostgreSQL 17 → 18)

Not in-place — different PGDATA path **and** a major engine bump. Migrate with a logical
`pg_dump -Fc | pg_restore` (dump from the old instance with the **PG18** client). A proven,
throwaway test procedure and the per-environment rollout are in the DevOps runbook
`pg-major-migration-dump-restore.md`. Roll out dev → stg → prod; keep the old PVC for rollback.

## 4. Supply chain

CloudPirates charts pull from `oci://registry-1.docker.io/cloudpirates` (public, anonymous)
and run Docker Official Images straight from Docker Hub. To control image rate limits /
supply chain, mirror `postgres`/`redis`/`mariadb` tags into your own registry and override
`image.registry` per consumer.
