resource "azurerm_virtual_network" "k8s" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  address_space       = [var.virtual_network_address_prefix]

  subnet {
    name           = var.kubernetes_subnet_name
    address_prefix = var.kubernetes_subnet_address_prefix
  }

  subnet {
    name           = var.appgateway_subnet_name
    address_prefix = var.app_gateway_subnet_address_prefix
  }


  tags = var.tags
}

data "azurerm_subnet" "appgwsubnet" {
  name                 = var.appgateway_subnet_name
  virtual_network_name = azurerm_virtual_network.k8s.name
  resource_group_name  = azurerm_resource_group.k8s.name
}

data "azurerm_subnet" "kubesubnet" {
  name                 = var.kubernetes_subnet_name
  virtual_network_name = azurerm_virtual_network.k8s.name
  resource_group_name  = azurerm_resource_group.k8s.name
 }

# Public Ip 
resource "azurerm_public_ip" "publicIp1" {
  name                         = "ingress"
  location                     = azurerm_resource_group.k8s.location
  resource_group_name          = "${azurerm_resource_group.k8s.name}-node"
  allocation_method            = "Static"
  sku                          = "Basic"

  tags = var.tags
  depends_on = [
    azurerm_kubernetes_cluster.k8s,
  ]
}