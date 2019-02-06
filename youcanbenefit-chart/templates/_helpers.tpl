{{/* vim: set filetype=mustache: */}}

{{/*
Domain name for auto TLS generation.
*/}}
{{- define "youcanbenefit-chart.domain" -}}
{{- if eq .Values.ingress.autotls true -}}
{{- printf "%s.%s" .Release.Name .Values.host -}}
{{- else -}}
{{- printf "%s" .Values.host -}}
{{- end -}}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "youcanbenefit-chart.frontend.name" -}}
{{- $maybe := printf "%s-%s" .Chart.Name .Values.frontend.name -}}
{{- default $maybe .Values.frontend.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "youcanbenefit-chart.backend.name" -}}
{{- $maybe := printf "%s-%s" .Chart.Name .Values.backend.name -}}
{{- default $maybe .Values.backend.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "youcanbenefit-chart.elasticsearch.name" -}}
{{- $maybe := printf "%s-%s" .Chart.Name .Values.elasticsearch.name -}}
{{- default $maybe .Values.elasticsearch.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "youcanbenefit-chart.frontend.fullname" -}}
{{- if .Values.frontend.fullnameOverride -}}
{{- .Values.frontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $maybe := printf "%s-%s" .Chart.Name .Values.frontend.name -}}
{{- $name := default $maybe .Values.frontend.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "youcanbenefit-chart.backend.fullname" -}}
{{- if .Values.backend.fullnameOverride -}}
{{- .Values.backend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $maybe := printf "%s-%s" .Chart.Name .Values.backend.name -}}
{{- $name := default $maybe .Values.backend.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "youcanbenefit-chart.elasticsearch.fullname" -}}
{{- if .Values.elasticsearch.fullnameOverride -}}
{{- .Values.elasticsearch.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $maybe := printf "%s-%s" .Chart.Name .Values.elasticsearch.name -}}
{{- $name := default $maybe .Values.elasticsearch.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "youcanbenefit-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
