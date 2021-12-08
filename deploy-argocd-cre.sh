#!/bin/bash 

kubectl create ns argocd-cre
kubectl -n argocd-cre apply -f install-argocd-cre.yaml
