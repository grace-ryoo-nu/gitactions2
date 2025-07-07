#!/bin/bash

# Example repo: prometheus-community/prometheus
REPO="prometheus-community/prometheus"
CURRENT_VERSION=$(cat .github/scripts/prometheus-version.txt)

# Get latest version from Helm repo
LATEST_VERSION=$(helm search repo $REPO -o json | jq -r '.[0].version')

echo "Current version: $CURRENT_VERSION"
echo "Latest version: $LATEST_VERSION"

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
  echo "New version available!"
  echo "IS_NEW_VERSION=true" >> $GITHUB_ENV
  echo "NEW_VERSION=$LATEST_VERSION" >> $GITHUB_ENV
else
  echo "No new version found."
  echo "IS_NEW_VERSION=false" >> $GITHUB_ENV
fi
