
# # Locals block for hardcoded names. 
locals {
    backend_address_pool_name      = "${azurerm_virtual_network.k8s.name}-beap"
    frontend_port_name             = "${azurerm_virtual_network.k8s.name}-feport"
    frontend_ip_configuration_name = "${azurerm_virtual_network.k8s.name}-feip"
    http_setting_name              = "${azurerm_virtual_network.k8s.name}-be-htst"
    listener_name                  = "${azurerm_virtual_network.k8s.name}-httplstn"
    request_routing_rule_name      = "${azurerm_virtual_network.k8s.name}-rqrt"
    app_gateway_subnet_name = "appgwsubnet"
}

resource "tls_private_key" "default" {
  algorithm = "RSA"
  rsa_bits = 4096
}
