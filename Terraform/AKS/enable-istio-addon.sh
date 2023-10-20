#!/bin/sh

export CLUSTER=anuchunduridevopsaks
export RESOURCE_GROUP=anuchunduridevops-rg

# Install aks-preview extension and udpate to latest version (istio is a aks preview feature)
az extension add --name aks-preview
az extension update --name aks-preview

# Register AzureServiceMeshPreview feature flag and verify
az feature register --namespace "Microsoft.ContainerService" --name "AzureServiceMeshPreview"
az feature show --namespace "Microsoft.ContainerService" --name "AzureServiceMeshPreview"
az provider register -n Microsoft.ContainerService

#If you are to instal Istio add-io for an existing cluster after its creation
az aks mesh enable --resource-group ${RESOURCE_GROUP} --name ${CLUSTER}

#Verify istio successful installation on AKS cluster
az aks show --resource-group ${RESOURCE_GROUP} --name ${CLUSTER}  --query 'serviceMeshProfile.mode'

#Get AKS credentials
az aks get-credentials --name ${CLUSTER} --resource-group ${RESOURCE_GROUP}
