terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "aksreactorlab123"
    container_name       = "reactorlab"
    key                  = "aksreactorlab.tfstate"
  }
}

provider "azurerm" {
  features {}
  alias = "azurerm-test"
  partner_id = "d1e4547f-b660-46e1-a8fd-0189ab5ced8f"
  disable_terraform_partner_id = true
  skip_provider_registration = true
}

provider "random" {
}

provider "kubernetes" {
  version = ">= 1.11.1"
  host                   = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  username               = azurerm_kubernetes_cluster.k8s.kube_config.0.username
  password               = azurerm_kubernetes_cluster.k8s.kube_config.0.password
  client_certificate     = base64decode(
    azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
  client_key             = base64decode(
    azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(
    azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}