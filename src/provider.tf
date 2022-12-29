terraform {
  backend "azurerm" {
    resource_group_name  = "Ortelius-administrator"
    storage_account_name = "orteliusinfrastate"
    container_name       = "prod"
    key                  = "prod.tfstate"
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
