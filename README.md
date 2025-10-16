 Industry-Standard Approach for 100+ VMs
✅ Use a combination of:

Terraform modules for reusable logic

YAML/JSON-based inventory as source of truth

Ansible or CI/CD to orchestrate Terraform runs

Templating to auto-generate .tfvars per VM

Secrets managed by Vault/SOPS, not hardcoded# ansible-vm-automation

Order of execution

terraform_apply_esxi

prechecks
containerd
kubernetes

k8s-aliases
helm

metallb - through manifests
traefik - through helm

argocd - through manifests

cert-manager - through helm and argocd
ci-cd-app-argocd-deploy - through helm and argocd
