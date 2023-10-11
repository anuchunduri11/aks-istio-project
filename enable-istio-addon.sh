#!/bin/sh

export CLUSTER=anuchunduridevopsaks
export RESOURCE_GROUP=anuchunduridevops-rg
export LOCATION=swedencentral

# Install aks-preview extension and udpate to latest version (istio is a aks preview feature)
az extension add --name aks-preview
az extension update --name aks-preview

# Register AzureServiceMeshPreview feature flag and verify
az feature register --namespace "Microsoft.ContainerService" --name "AzureServiceMeshPreview"
az feature show --namespace "Microsoft.ContainerService" --name "AzureServiceMeshPreview"
az provider register -n Microsoft.ContainerService
