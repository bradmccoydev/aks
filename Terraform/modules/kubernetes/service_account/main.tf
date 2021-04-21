resource "kubernetes_secret" "dns_service_account_credentials" {
  metadata {
    name      = "azure-dns-credentials"
    namespace = "kube-infra"
  }

  data = {
    "credentials.json" = base64decode(google_service_account_key.dns_svc_json.private_key)
  }

  type = "generic"

}