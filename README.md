# ArgoCD-CRE

Implementing continuouse delivery for the CRE team workloads using ArgoCD and GitOps workflow on the client cluster.

## Challanges and solutions:
The client may already has his own ArgoCD instance running on his cluster, so We need to make the following changes to deploy our ArgoCD instance next to his running one:

* Create new namespace to deploy our ArgoCD instance into (argocd-cre)
* Adjust the installation manafist for ArgoCD "install.yaml" as following:
	* Reference the new namespace
	* Creating a new ClusterRoleBinding by updating its names so that it won't misconfigure with the already deployed ones

## Deployment Steps:

* Copy the argocd-application-template.yaml to new file argocd-application.yaml and modify it with your GitHub repo URL and manifests path.
* Generate a GitHub access token with repo scopes
* Copy the repo-access-token-template.yaml to new file repo-access-token.yaml and modify it with your newly generated github access token
* Run the deploy-argocd-cre.sh bash script to deploy the ArgoCD instance for the CRE team and to create a test application that conclude the GitOps workflow.
