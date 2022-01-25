terraform {
  backend "azurerm" {
    resource_group_name  = "devops-prod"
    storage_account_name = "moulainfrastate"
    container_name       = "moula-training"
    key                  = "hug-lab.tfstate"
  }
}

provider "azurerm" {
  features {}
  partner_id                   = "d1e4547f-b660-46e1-a8fd-0189ab5ced8f"
  disable_terraform_partner_id = true
  skip_provider_registration   = true
}

provider "random" {
}

provider "kubernetes" {
  host                   = module.azurerm_kubernetes_cluster_primary.kube_config.0.host
  username               = module.azurerm_kubernetes_cluster_primary.kube_config.0.username
  password               = module.azurerm_kubernetes_cluster_primary.kube_config.0.password
  client_certificate     = base64decode(module.azurerm_kubernetes_cluster_primary.kube_config.0.client_certificate)
  client_key             = base64decode(module.azurerm_kubernetes_cluster_primary.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(module.azurerm_kubernetes_cluster_primary.kube_config.0.cluster_ca_certificate)
}
