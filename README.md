## Prerequisites for Local Kubernetes/Helm Deployment (Parts 3 & 4)

The Kubernetes manifests and the Helm chart deploy an Nginx Ingress resource to expose the application. This requires Ingress controller in the Kubernetes Cluster.
The following command was used to install the official "ingress-nginx" controller using Helm:

helm upgrade --install ingress-nginx ingress-nginx \
  --repo [https://kubernetes.github.io/ingress-nginx](https://kubernetes.github.io/ingress-nginx) \
  --namespace ingress-nginx --create-namespace
  
## Instructions to change environment port

On docker, change <PORT>:
docker run -dp 8080:<PORT> --name bulletin-container -e PORT=<PORT> bulletin-app:v1.0

On Kubernetes, modify on app/k8s/ the following files deployment.yaml and services.yaml:

k8s-deployment.yaml
      env:
      - name: PORT
        value: "<PORT>"
      ports:
      - containerPort: <PORT>

k8s-service.yaml
    ports:
      - protocol: TCP
        port: 80
        targetPort: <PORT>

## Link to GitHub Repository and Dockerhub artifact

https://hub.docker.com/repository/docker/taiestudo1/bulletin-app/
https://github.com/taiestudo/devops-test/tree/develop