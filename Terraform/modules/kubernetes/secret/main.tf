resource "kubernetes_secret" "generic" {
  metadata {
    name = var.name
    namespace = var.namespace
    annotations = {
      "meta.helm.sh/release-name" = "api-main"
      "meta.helm.sh/release-namespace" = "api"
    }
    labels = {
      "app.kubernetes.io/managed-by" = "Helm"
    }
  }

   data = {
    "${var.key}" = "${var.value}"
  }

}