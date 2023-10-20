#!/bin/sh

# label default namespace for injecting istio sidecar to application pods
kubectl label namespace default istio-injection=enabled
