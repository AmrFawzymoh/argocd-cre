# ArgoCD-CRE

Implementing continuouse delivery for the CRE team workloads using ArgoCD and GitOps workflow on the client cluster.

## Challanges and solutions:
The client may already has his own ArgoCD instance running on his cluster, so We need to make the following changes to deploy our ArgoCD instance next to his running one:

* Create new namespace to deploy our ArgoCD instance into (argocd-cre)
* Adjust the installation manafist for ArgoCD "install.yaml" as following:
	* Reference the new namespace
	* Creating a new ClusterRoleBinding by updating its names so that it won't misconfigure with the already deployed ones
