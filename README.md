## Prerequisites for Local Kubernetes/Helm Deployment (Parts 3 & 4)

The Kubernetes manifests and the Helm chart deploy an Nginx Ingress resource to expose the application. This requires Ingress controller in the Kubernetes Cluster.
The following command was used to install the official "ingress-nginx" controller using Helm:

helm upgrade --install ingress-nginx ingress-nginx \
  --repo [https://kubernetes.github.io/ingress-nginx](https://kubernetes.github.io/ingress-nginx) \
  --namespace ingress-nginx --create-namespace
  
## Link to GitHub Repository and Dockerhub artifact

https://hub.docker.com/repository/docker/taiestudo1/bulletin-app/
https://github.com/taiestudo/devops-test/tree/develop