module "azurerm_resource_group_hub" {
  source   = "git@github.com:bradmccoydev/terraform-modules.git//azurerm/azurerm_resource_group"
  count    = var.cloud_provider == "Azure" ? 1 : 0

  name     = local.shared_name
  location = var.cloud_location_1.name

  budget_amount = var.client_budget_amount
  contact_emails = [var.client_project_admin]

  tags     = merge(local.tags, var.cloud_custom_tags)
}
