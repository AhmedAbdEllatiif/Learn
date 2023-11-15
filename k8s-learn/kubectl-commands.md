
1. **To create pod from yml file**
   ```bash
   kubectl apply -f <file-name.yaml>

2. **To create a new deployment**
    ```bash
    kubectl create deployment <deployment-name> --image=<image:tag> 
3. **To descibe**
   ```bash
   kubectl describe <pod,deployment,etc..> <name>
4. **To export data in json format**
    ```bash
    kubectl get pods -o json
5. **To select from labels**
    ```bash
    kubectl get pod --selector/-l <env=prod>

6. *To delete a pod**
    ```bash
    kubectl delete pod <pod-name>

7. **To delete all pods**
    ```bash
    kubectl delete pod --all

8. **To show all pods with their ips**
    ```bash
    kubectl get pods -o wide

9. **scale deployment <deployment-name> --replicas=<count>**
    ```bash
    kubectl scale deployment web-app --replicas=3

10. **To access minikube local server **
    ```bash
    minikube ssh

11. **To show all api resources**
    ```bash
    kubectl api-resources

12. **scale deployment <deployment-name> --replicas=<count>**
    ```bash
    kubctl scale deployment --replicas=<number>

13. **To expose servcice for a running deployment**
 **types:**
   **- ClusterIp**
   **- NodePort**
   **- LoadBalancer**
   **- ExternalService**
    ```bash
    kubctl expose deployment <deployment-name> --name=<service-name> --type=<service-type> --port=9090 --target-port=9090


14. **To forward a port**
    ```bash
    kubectl port-forward service/<serivce-name> <host-port>:<contianer-port>


15. **To create configmap file**
    ```bash
    kubectl create configmap <name-inside-the-cluster> --from-file=<absolute-file-path>

16. **To create secret file**
    **types:**
    **- generic**
    **- docker-registry**
    **- tls**
    ```bash
    kubectl create secret <secret-type> <secret-name> --from-literal='key'='value'