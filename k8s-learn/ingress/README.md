<p align="center">
<img src="https://github.com/AhmedAbdEllatiif/AhmedAbdEllatiif/assets/40568882/ca8d1198-6c92-4f67-a982-786269c4a64e" alt="Description of the image" height="500" width="500">
</p>

# Exposing simple node app with Ingress

This repository provides instructions for exposing node app  using ingress.

## Prerequisites

Before you proceed, make sure you have the following tools installed:

- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): The Kubernetes command-line tool.
- A running Kubernetes cluster. You can use [Minikube](https://minikube.sigs.k8s.io/docs/start/) for local development.

## Getting Started

Follow these steps to run the Node.js app on Kubernetes:

1. **Start minikube**
   ```bash
    minikube start
2. **Enable Ingress**
    ```bash
    minikube addons enable ingress
3. **Enable Ingress-DNS**
   ```bash
    minikube addons enable ingress-dns
4. **Wait until you see the ingress-nginx-controller-XXXX is up and running**
    ```bash
    Kubectl get pods -n ingress-nginx
6. **(OPTIONAL) Create new namespace**
    ```bash
    Kubectl create namespace <your-name-space>
7. **Apply all files**
    ```bash
    Kubectl apply -f . -n <your-name-space>
8. **Append 127.0.0.1 webapp-example.com to your /etc/hosts**
    ```bash
    echo "127.0.0.1 webapp-example.com" | sudo tee -a /etc/hosts 
9. **Open minikube tunnel (will ask for a password)**
    ```bash
    minikube tunnel 
10. **Open Browser hit webapp-example.com/v1 or webapp-example.com/v2**


