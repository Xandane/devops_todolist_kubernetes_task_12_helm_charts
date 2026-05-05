#!/bin/bash
# Create namespace (ignore if exists)
kubectl create namespace todoapp-ns --dry-run=client -o yaml | kubectl apply -f -
# Deploy helm chart
helm install todoapp ./helm-chart/todoapp --namespace todoapp-ns --create-namespace
# Створення кластера
kind create cluster --name mycluster --config cluster.yml
# Перевірка нод
kubectl get nodes --show-labels
# Тейнінг нод з app=mysql
kubectl taint nodes -l app=mysql app=mysql:NoSchedule