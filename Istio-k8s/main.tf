resource "kubernetes_labels" "istio_sidecar" {
  api_version = "v1"
  kind        = "Namespace"
  metadata {
    name = "default"
  }
  labels = {
    "istio.io/rev" = "asm-1-17"
  }
}
