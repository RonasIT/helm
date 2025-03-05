{{- define "common.resources.preset" -}}
{{/* The limits are the requests increased by 50% (except ephemeral-storage and xlarge/2xlarge sizes)*/}}
{{- $presets := dict
  "nano" (dict
      "requests" (dict "cpu" "50m" "memory" "128Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "memory" "128Mi" "ephemeral-storage" "2Gi")
   )
  "micro" (dict
      "requests" (dict "cpu" "100m" "memory" "256Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "memory" "256Mi" "ephemeral-storage" "2Gi")
   )
  "small" (dict
      "requests" (dict "cpu" "200m" "memory" "512Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "memory" "384Mi" "ephemeral-storage" "2Gi")
   )
  "medium" (dict
      "requests" (dict "cpu" "400m" "memory" "1024Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "memory" "1024Mi" "ephemeral-storage" "2Gi")
   )
  "large" (dict
      "requests" (dict "cpu" "1.0" "memory" "2048Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "memory" "2048Mi" "ephemeral-storage" "2Gi")
   )
  "xlarge" (dict
      "requests" (dict "cpu" "2.0" "memory" "4096Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "memory" "4096Mi" "ephemeral-storage" "2Gi")
   )
  "2xlarge" (dict
      "requests" (dict "cpu" "4.0" "memory" "8192Mi" "ephemeral-storage" "50Mi")
      "limits" (dict "cpu" "4.0" "memory" "8192Mi" "ephemeral-storage" "2Gi")
   )
}}
{{- if hasKey $presets .type -}}
{{- index $presets .type | toYaml -}}
{{- else -}}
{{- printf "ERROR: Preset key '%s' invalid. Allowed values are %s" .type (join "," (keys $presets)) | fail -}}
{{- end -}}
{{- end -}}
