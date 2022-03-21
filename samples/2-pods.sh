# Check which worker nodes are ready
kubectl get nodes -o wide

# Start a single instance of nginx pod (imperative way)
kubectl run nginx --image=nginx:alpine

# Describe the nginx pod (check events)
kubectl describe pod nginx

# Get pod details
kubectl get pods -o wide

# Listen on port 8080 on the local machine and forward to port 80 on the nginx pod
kubectl port-forward nginx 8080:80

# Show logs from the nginx pod
kubectl logs nginx

# Run command in existing pod (similar to docker exec...)
kubectl exec -it nginx -- sh

# Try these commands inside the nginx pod:
cd /usr/share/nginx/html
ls
ps aux
telnet
exit

# Copy the nginx pod while adding a new container
kubectl debug -it nginx --image=busybox --share-processes --copy-to=nginx-debug

# Try these commands inside the nginx pod:
telnet localhost 80
exit

# Delete all pods
kubectl get pods
kubectl delete pods nginx nginx-debug
kubectl get pods

# Start a single instance of nginx pod (declarative way)
kubectl apply -f pod.yaml

# Get pod details
kubectl get pods

# Edit pod.yaml, change nginx:1.20 to nginx:1.21, and apply changes
kubectl apply -f pod.yaml

# Describe the nginx pod (check events)
kubectl describe pod nginx

# Trigger liveness probe (delete index.html)
kubectl exec -it nginx -- sh
cd /usr/share/nginx/html
rm index.html
exit

# Get pod details (container should restart)
kubectl get pods

# Describe the nginx pod (check events)
kubectl describe pod nginx

# Check the index.html file
kubectl exec -it nginx -- sh
cd /usr/share/nginx/html
ls
exit

# Delete the nginx pod
kubectl delete -f pod.yaml