#!/bin/bash

# Ensure we're logged in
# argocd login localhost:8080 --username admin --password "$ARGOCD_PASSWORD" --insecure

# Create application
argocd app create ci-cd-app \
  --project default \
  --repo https://github.com/nagarajurahul/helm-charts \
  --path ci-cd-app \
  --revision HEAD \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default \
  --sync-policy automated \
  --self-heal \
  --auto-prune
  
# Immediately sync
argocd app sync my-app
