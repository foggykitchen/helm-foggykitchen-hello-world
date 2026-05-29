{{- define "foggykitchen-hello-world.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "foggykitchen-hello-world.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "foggykitchen-hello-world.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "foggykitchen-hello-world.labels" -}}
app.kubernetes.io/name: {{ include "foggykitchen-hello-world.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "foggykitchen-hello-world.selectorLabels" -}}
app.kubernetes.io/name: {{ include "foggykitchen-hello-world.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
