#!/bin/bash 

cre_namespace=argocd-cre
cp install-template.yaml install-$cre_namespace.yaml

eval "cat <<EOF
$(<install-$cre_namespace.yaml)
EOF
" 2> /dev/null > install-$cre_namespace.yaml

kubectl create ns $cre_namespace
kubectl -n $cre_namespace apply -f install-$cre_namespace.yaml
