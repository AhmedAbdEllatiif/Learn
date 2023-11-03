
# Sending TPS report reminder mail

This project provides instructions for sending a report mail to multiple recipient.

## Prerequisites

Before you proceed, make sure you have the following tools installed:

- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): The Kubernetes command-line tool.
- A running Kubernetes cluster. You can use [Minikube](https://minikube.sigs.k8s.io/docs/start/) for local development.

## Getting Started

Follow these steps to run the Node.js app on Kubernetes:

1. **Update package manager**
   ```bash
   apt update
2. **Install ssmpt and mailutils**
    ```bash
   apt install ssmtp mailutils -y
3. **Check mail version**
   ```bash
   mail version
4. **Generate app password for your mail**
    [Link Follow these instructions](https://www.devopszones.com/2020/03/how-to-create-use-app-passwords-in-gmail.html)
5. **Edit ssmpt.conf file**
    ```bash
    sudo nano /etc/ssmtp/ssmtp.conf

6. **Edit these values**
    root=<YOUR-MAIL>@gmail.com
    mailhub=smtp.gmail.com:587
    FromLineOverride=YES
    AuthUser=<YOUR>@gmail.com
    AuthPass=<generated-app-password-without-spaces>
    UseTLS=YES
    UseSTARTTLS=YES

7. **Make the sendmail.sh executable** 
    ```bash
    sudo chmod 777 sendmail.sh  

./sendmail.sh -r "Recipient1, Recipient2" -d "Monday" -m "Your-Message" -s "Sender-name"
