# Create a ClusterIP (internal) service
kubectl apply -f cluster-ip-service.yaml

# Check the service endpoints
kubectl get service frontend -o wide
kubectl describe service frontend
kubectl get pods -o wide
kubectl delete pod <pod-name>

# Listen on port 8080 on the local machine and forward to port 80 on the frontend service
kubectl port-forward service/frontend 8080:80

# Create a LoadBalancer (external) service
kubectl apply -f load-balancer-service.yaml

# Check the service
kubectl get service frontend -o wide

# Delete all resources
kubectl delete -f load-balancer-service.yaml
kubectl delete -f deployment.yaml