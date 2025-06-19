#!/bin/bash

set -e

KUBE_DIR="$HOME/.kube"
CONFIG_FILE="$KUBE_DIR/config"

mkdir -p "$KUBE_DIR"
cp -i /etc/kubernetes/admin.conf "$CONFIG_FILE"
chown "$(id -u)":"$(id -g)" "$CONFIG_FILE"

echo "✅ kubeconfig setup complete for user: $(whoami)"
