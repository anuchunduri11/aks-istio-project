# aks-istio-project
This repository contains some basic Azure Terraform code to deploy an AKS cluster, an ACR, a virtual network and a subnet for AKS, and the right role assignments for the AKS cluster to access the ACR (AcrPull) and Virtual Network (Network Contributor).
It contains scripts to deploy Istio service mesh (if not enabling the Istio service mesh add on through Terraform code for AKS) and Nginx Ingress Controller on the AKS cluster.

It contains kubernetes manifest files to

a) configure nginx ingress to work with istio service mesh

b) enable mtls with istio

c) sample applications to test mtls with istio and nginx ingress.

The wireshark capture included is a snippet that has been obtained by installing krew, sniff and wireshark on the local machine and using kubectl sniff commands (kubectl sniff -p pod-name -n namespace) to get wireshark capture.
