#!/bin/bash
# Create namespace (ignore if exists)
kubectl create namespace todoapp-ns --dry-run=client -o yaml | kubectl apply -f -
# Deploy helm chart
helm install todoapp ./helm-chart/todoapp --namespace todoapp-ns --create-namespace
