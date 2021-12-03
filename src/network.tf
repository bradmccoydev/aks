resource "azurerm_virtual_network" "k8s" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  address_space       = [var.virtual_network_address_prefix]

  subnet {
    name           = var.kubernetes_subnet_name
    address_prefix = var.kubernetes_subnet_address_prefix
  }

  tags = var.tags
}

data "azurerm_subnet" "kubesubnet" {
  name                 = var.kubernetes_subnet_name
  virtual_network_name = azurerm_virtual_network.default.name
  resource_group_name  = azurerm_resource_group.default.name
 }
