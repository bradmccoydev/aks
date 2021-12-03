locals {
  tags = {
    environment = var.client_environment
    owner       = var.client_id
    repo        = var.client_project_repo
    project     = var.client_project_id
  }

  backend_address_pool_name      = "${azurerm_virtual_network.k8s.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.k8s.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.k8s.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.k8s.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.k8s.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.k8s.name}-rqrt"
  app_gateway_subnet_name = "appgwsubnet"
}
