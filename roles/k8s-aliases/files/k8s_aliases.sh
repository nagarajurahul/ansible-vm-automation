#!/bin/sh

# General Aliases:
alias k='kubectl'
alias ks='kubectl -n kube-system'
alias kdesc='kubectl describe'
alias kn='kubectl -n'

# Create Resources:
alias kcf='kubectl create -f'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'

# Get resources:
alias kg='kubectl get'
alias kgall='kubectl get all'
alias kgn='kubectl get nodes'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgs='kubectl get services'
alias kgsa='kubectl get services --all-namespaces'
alias kgd='kubectl get deployments'
alias kgr='kubectl get replicasets'
alias kgns='kubectl get namespaces'
alias kgl='kubectl get logs'

# Delete Resources:
alias kd='kubectl delete'
alias kdp='kubectl delete pod'
alias kds='kubectl delete service'
alias kdd='kubectl delete deployment'
alias kdn='kubectl delete namespace'