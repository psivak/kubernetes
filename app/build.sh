# Build and push a container image to Docker Hub
docker build -t dotnet-sample-app .
docker tag dotnet-sample-app:latest psivak/dotnet-sample-app:latest
docker push psivak/dotnet-sample-app:latest

# Deploy the application
kubectl apply -f ./kubernetes/deployment.yaml
kubectl apply -f ./kubernetes/service.yaml