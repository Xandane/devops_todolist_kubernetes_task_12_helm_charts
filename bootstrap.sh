#!/bin/bash
# Спочатку створюємо кластер
kind create cluster --name mycluster --config cluster.yml
# Перевіряємо ноди
kubectl get nodes --show-labels
# Тейнінг mysql нод
kubectl taint nodes -l app=mysql app=mysql:NoSchedule
# Деплоїмо
kubectl create namespace todoapp-ns --dry-run=client -o yaml | kubectl apply -f -
helm install todoapp ./helm-chart/todoapp --namespace todoapp-ns --create-namespace
