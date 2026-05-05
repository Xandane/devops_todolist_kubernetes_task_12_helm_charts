#!/bin/bash

kind create cluster --name mycluster --config cluster.yml

kubectl get nodes --show-labels

kubectl taint nodes -l app=mysql app=mysql:NoSchedule

kubectl create namespace todoapp-ns --dry-run=client -o yaml | kubectl apply -f -
helm install todoapp ./helm-chart/todoapp --namespace todoapp-ns --create-namespace
