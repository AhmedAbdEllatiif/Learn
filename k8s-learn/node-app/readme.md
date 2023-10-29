# Running a Node.js App using Kubernetes

This repository provides instructions for deploying and running a Node.js application using Kubernetes.

## Prerequisites

Before you proceed, make sure you have the following tools installed:

- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): The Kubernetes command-line tool.
- A running Kubernetes cluster. You can use [Minikube](https://minikube.sigs.k8s.io/docs/start/) for local development.

## Getting Started

Follow these steps to run the Node.js app on Kubernetes:

1. **Apply the Kubernetes deployment configuration:**
   ```bash
   kubectl apply -f deployment-file.yml
2. **Expose a new service from the created Deployment:**
    ```bash
    kubctl expose deployment node-web-app --name=node-app-service --port=4000
3. **Run the app with minikube**
   ```bash
    minikube service node-app-service
4. **Run the app using port-forward**
    ```bash
    kubectl port-forward service/node-app-service 4000:4000