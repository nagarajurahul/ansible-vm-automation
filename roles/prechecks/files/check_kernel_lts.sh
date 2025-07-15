#!/bin/bash

# Get current kernel version (major.minor only)
current_version=$(uname -r | cut -d'.' -f1,2)
echo "Current kernel version: $current_version"

# Fetch LTS versions from kernel.org
lts_versions=$(curl -s https://www.kernel.org/releases.json | jq -r '.releases[] | select(.moniker=="longterm") | .version')

# Check if current version is in LTS list
is_lts=false
for version in $lts_versions; do
  if [[ "$current_version" == "$version" ]]; then
    is_lts=true
    break
  fi
done

# Output result
if [ "$is_lts" = true ]; then
  echo "✅ Kernel $current_version is an LTS version."
else
  echo "⚠️ Kernel $current_version is NOT an LTS version."
fi
