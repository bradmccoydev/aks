resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations = {
      name = var.name
    }

    labels = {
      description = var.description
    }

    name = var.name
  }
}