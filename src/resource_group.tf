module "azurerm_resource_group" {
  source   = "github.com/bradmccoydev/terraform-modules//azurerm/azurerm_resource_group"
  name     = local.shared_name
  location = var.cloud_location_1.name

  budget_amount = var.client_budget_amount
  contact_emails = [var.client_project_admin]

  tags     = merge(local.tags, var.cloud_custom_tags)
}
