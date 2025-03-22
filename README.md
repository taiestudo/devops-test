# DevOps Practice Test

This repository contains a hands-on DevOps assessment covering Docker, Kubernetes, Git, AWS, Helm, and Terraform. You can utilize any AI, Google Search, or other tools, but do it yourself.

---

## Deliverables
- Fork this repo to youir GitHub personal account to commit all your code and deliverables 
- Push all code, configs, and files to your repo
- Upload a shell.txt with all correct commands needed to perform below actions, also copy and paste CLI outputs (Split and organize per parts like the test) 
- Answers to AWS conceptual questions to answers.txt
- Make it public and inform your repo and branch at the end of the test

---

## Requirements
- Docker Desktop with Kubernetes enabled
- AWS CLI configured
- Git CLI
- Terraform
- Helm
- An AWS account (or sandbox)

---

## Part 1: Git CLI

**Objective**: Demonstrate proficiency with Git

- Fork and clone Node.js [Bulletin Board App](https://github.com/docker/getting-started/tree/master/app) app repository
- Create a feature branch called develop
- Modify the app to support configurable port via env variable
- Commit and push changes
- Simulate a merge conflict and resolve it
- Use stash, switch branches, and re-apply changes

---

## Part 2: Docker

**Objective**: Build and run Docker containers for Bulletin

- Optimize Dockerfile using a minimal base image
- Add .dockerignore
- Build and tag the image
- Run the container using env-based port
- Inspect container and image

---

## Part 3: Kubernetes Deployment

**Objective**: Deploy Bulletin to local Kubernetes cluster

- Create Deployment, Service, and Ingress manifests
- Use env variable for port in Deployment
- Deploy with kubectl
- Test app access via Ingress

---

## Part 4: Helm Chart

**Objective**: Package Bulletin app using Helm

- Scaffold Helm chart
- Template Deployment, Service, Ingress
- Parametrize image, port, replicas, and ingress path
- Install and upgrade Helm release local

---

## Part 5: AWS Services

**Objective**: Demonstrate AWS CLI usage and service understanding

- Create S3 bucket and enable versioning
- Upload file to bucket
- Launch EC2 instance in specific VPC and attach Security Group
- List EC2 instances, S3 buckets, and IAM users
- Answer:
  - What is IAM Role?
  - Security Group vs NACL?
  - S3 lifecycle rule use cases?
  - What services manages DNS in AWS?
  - What is the difference between SSM and SSH?

---

## Part 6: Terraform

**Objective**: Provision AWS infrastructure using Terraform

- Create VPC (10.0.0.0/16)
- Create 2 public subnets in different AZs
- Tag all resources (e.g., environment = dev)
- Launch t2.micro EC2 instance with SSH access open to the Internet
- Output VPC ID, subnet IDs, and instance public IP
- Destroy all resources

---

## Part 7: CI/CD Pipeline Design

**Objective**: Create and implement a CI/CD pipeline for Bulletin in GitHub Actions

- Build Docker image on push
- Push to container registry

---

## Resources
- [Bulletin Board App](https://github.com/docker/getting-started/tree/master/app)
- [AWS CLI Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Helm Charts](https://helm.sh/docs/topics/charts/)
