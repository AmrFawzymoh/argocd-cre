#!/bin/bash 

# Declare the namespace used to deploy the ArgoCD instance for the CRE team on the client cluster
argocd_namespace=argocd-client

# Create a modified install.yaml file specifing the new namespace and the two new ClusterRoleBinding
cp install-template.yaml install-$argocd_namespace.yaml

eval "cat <<EOF
$(<install-$argocd_namespace.yaml)
EOF
" 2> /dev/null > install-$argocd_namespace.yaml

# Deploy the ArgoCD instance for the CRE team in the new namespace using the modified install manifest
kubectl create ns $argocd_namespace
kubectl -n $argocd_namespace apply -f install-$argocd_namespace.yaml

# Create a K8s secret for the GitHub access token used to grant the ArgoCD instance access to the CRE GitHub repository
kubectl -n $argocd_namespace apply -f repo-access-token.yaml

# Create ArgoCD application
kubectl -n $argocd_namespace apply -f argocd-application.yaml
