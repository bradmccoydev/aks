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
