# Install Windows Subsystem for Linux (WSL) 2 + Ubuntu 20.04
# https://docs.microsoft.com/en-us/windows/wsl/install
# wsl --install

# Install Kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl

# Enable kubectl autocompletion (Bash)
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-kubectl-autocompletion

echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

# Install Azure CLI
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Sign in with Azure CLI
# Use tenant-id from the Azure Active Directory Overview page
az login

# Change the active subscription
az account list --output table
az account set --subscription <subscription-id>

# List managed Kubernetes clusters
az aks list --output table

# Start your AKS cluster
az aks start --name <name> --resource-group <resource-group>

# Configure kubectl
az aks get-credentials --resource-group demo --name aks

# Display addresses of the control plane and services
kubectl cluster-info