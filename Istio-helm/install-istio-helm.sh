#!/bin/sh

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create ns istio-system

helm install istio-base istio/base -n istio-system --set defaultRevision=default
helm install istiod istio/istiod -n istio-system --wait
