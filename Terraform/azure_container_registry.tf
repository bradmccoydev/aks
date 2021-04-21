resource "azurerm_container_registry" "api" {
  name                     = var.api_container_name
  resource_group_name      = azurerm_resource_group.k8s.name
  location                 = azurerm_resource_group.k8s.location
  sku                      = "Basic"
  admin_enabled            = true

  tags       = var.tags
}

resource "azurerm_container_registry" "ui" {
  name                     = var.ui_container_name
  resource_group_name      = azurerm_resource_group.k8s.name
  location                 = azurerm_resource_group.k8s.location
  sku                      = "Basic"
  admin_enabled            = true

  tags       = var.tags
}