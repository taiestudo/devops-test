## Prerequisites for Local Kubernetes/Helm Deployment (Parts 3 & 4)

The Kubernetes manifests and the Helm chart deploy an Nginx Ingress resource to expose the application. This requires Ingress controller in the Kubernetes Cluster.
The following command was used to install the official "ingress-nginx" controller using Helm:

helm upgrade --install ingress-nginx ingress-nginx \
  --repo [https://kubernetes.github.io/ingress-nginx](https://kubernetes.github.io/ingress-nginx) \
  --namespace ingress-nginx --create-namespace
  
## Instructions to change environment port

Docker:
Edit ENVPORT on run command
docker run -dp 8080:ENVPORT --name bulletin-container -e PORT=ENVPORT bulletin-app:v1.0

Kubernetes:
Edit ENVPORT on app/k8s/deployment.yaml and app/k8s/services.yaml:

k8s-deployment.yaml
      env:
      - name: PORT
        value: "ENVPORT"
      ports:
      - containerPort: ENVPORT

k8s-service.yaml
    ports:
      - protocol: TCP
        port: 80
        targetPort: ENVPORT

Helm:
Edit app/bulletin-chart/values.yaml

values.yaml
  targetPort: ENVPORT

## Link to GitHub Repository and Dockerhub artifact

https://hub.docker.com/repository/docker/taiestudo1/bulletin-app/
https://github.com/taiestudo/devops-test/tree/develop