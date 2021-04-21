resource "kubernetes_secret" "tls" {
  metadata {
    name = var.name
    namespace = var.namespace
  }

  data = {
    "tls.crt" = "${file("${path.module}/bradmccoydev.crt")}"
    "tls.key" = "${file("${path.module}/bradmccoydev.key")}"
  }

  type = "kubernetes.io/tls"
}