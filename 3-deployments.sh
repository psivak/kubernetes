# Start nginx deployment
kubectl apply -f deployment.yaml

# Check the current state
kubectl get deployment
kubectl describe deployment nginx
kubectl get replicaset
kubectl describe replicaset
kubectl get pods -o wide

# Try to delete a pod
kubectl delete pod <pod-name>
kubectl get pods -o wide

# Edit deployment.yaml, change the image version from 1.20 to 1.21, and apply changes
kubectl apply -f deployment.yaml

# Check the current state
kubectl get deployment
kubectl describe deployment nginx
kubectl get replicaset
kubectl describe replicaset
kubectl get pods -o wide

# Scale the nginx deployment to 2
kubectl scale deployment nginx --replicas=2
kubectl get deployment
kubectl get pods -o wide

# Check labels
kubectl get deployment -o wide
kubectl get pods --show-labels

kubectl logs -l app=frontend
kubectl get pods -l app=frontend