module "azurerm_key_vault_primary" {
  source = "git@github.com:bradmccoydev/terraform-modules.git//azurerm/azurerm_key_vault"
  count  = var.cloud_provider == "Azure" ? 1 : 0
  name                       = "${local.shared_name}-1qb5"
  resource_group_name        = module.azurerm_resource_group_hub[0].name
  location                   = var.cloud_location_1.name
  tenant_id                  = var.cloud_tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  sku_name                   = "standard"

  tags = merge(local.tags, var.cloud_custom_tags)
}

module "azurerm_key_vault_access_policy_primary_groups" {
  source = "git@github.com:bradmccoydev/terraform-modules.git//azurerm/azurerm_key_vault_access_policy"

  for_each = toset(var.client_access_groups)

  key_vault_id = module.azurerm_key_vault_primary[0].id
  tenant_id    = var.cloud_tenant_id
  object_id    = each.value

  secret_permissions      = ["Get", "List", "Set", "Delete"]
  key_permissions         = ["Get", "List"]
  certificate_permissions = ["Get", "List"]
}

module "azurerm_key_vault_secret_primary" {
  source = "git@github.com:bradmccoydev/terraform-modules.git//azurerm/azurerm_key_vault_secret"
  count  = var.cloud_provider == "Azure" ? 1 : 0
  depends_on = [
    module.azurerm_key_vault_access_policy_primary_groups[0]
  ]
  name         = "bastion-${module.random_string_suffix.result}"
  value        = module.tls_private_key.tls_private_key
  key_vault_id = module.azurerm_key_vault_primary[0].id
  content_type = "Bastion Key"
}
