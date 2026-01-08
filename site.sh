#!/bin/bash

# Define pause duration in seconds
PAUSE_BETWEEN=30

# Helper to print sections
print_banner() {
  echo
  echo "========================================"
  echo "▶ $1"
  echo "========================================"
  echo
}

# Run each playbook with delay

# print_banner "Configuring UFW" 
# ansible-playbook -i k8s.ini playbook-ufw.yml 
# sleep $PAUSE_BETWEEN

print_banner "Installing Kubernetes"
ansible-playbook -i k8s.ini playbook-k8s.yml
sleep $PAUSE_BETWEEN

print_banner "Setting up K8s Aliases, Python Client and Installing Helm"
ansible-playbook -i k8s.ini playbook-k8s-extras.yml
sleep $PAUSE_BETWEEN

print_banner "Configuring MetalLB and Installing Traefik"
ansible-playbook -i k8s.ini playbook-k8s-networking.yml
sleep $PAUSE_BETWEEN

print_banner "Installing ArgoCD"
ansible-playbook -i k8s.ini playbook-argocd.yml
sleep $PAUSE_BETWEEN

print_banner "Install secrets prior to deploying ArgoCD application, Monitoring stack, GoFlights and quotes-app-nodejs application"
ansible-playbook -i k8s.ini playbook-secrets.yml
sleep $PAUSE_BETWEEN

print_banner "Deploying CI/CD App with ArgoCD"
ansible-playbook -i k8s.ini playbook-argocd-ci-cd-app.yml
sleep $PAUSE_BETWEEN

print_banner "Deploying SQL with ArgoCD"
ansible-playbook -i k8s.ini playbook-sql.yml
sleep 60
# Need extra time for SQL to boot up

print_banner "Deploying GoFlights Appication with ArgoCD"
ansible-playbook -i k8s.ini playbook-goflights.yml
sleep $PAUSE_BETWEEN

print_banner "Deploying quotes-app-nodejs Appication with ArgoCD"
ansible-playbook -i k8s.ini playbook-argocd-quotes-app-nodejs.yml
sleep $PAUSE_BETWEEN

print_banner "Installing Gatekeeper"
ansible-playbook -i k8s.ini playbook-gatekeeper.yml

echo
echo "✅ All playbooks executed successfully."
