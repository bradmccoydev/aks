terraform {
  backend "azurerm" {
    features {}
    resource_group_name  = "DEV"
    storage_account_name = "poc"
    container_name       = "tfstate"
    key                  = "bradmccoydev.tfstate"
  }
}

provider "azurerm" {
  version = "=1.44.0"
  features {}
  alias = "azurerm-test"
  disable_terraform_partner_id = true
  partner_id = var.cloud_partner_id
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