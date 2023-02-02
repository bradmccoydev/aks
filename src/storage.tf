resource "azurerm_storage_account" "default" {
  name                     = var.storage_account_name
  resource_group_name      = module.azurerm_resource_group.name
  location                 = var.cloud_location_1.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"

  tags = merge(local.tags, var.cloud_custom_tags)
}

resource "azurerm_storage_container" "default" {
  name                 = var.storage_container
  storage_account_name = azurerm_storage_account.default.name
}