
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

# ---------------------------------------------------------------------------------------------------------------------
# Namespaces
# ---------------------------------------------------------------------------------------------------------------------
//terraform foreach list of strings

module "kube_infra_namespace" {
  source = "./modules/kubernetes/namespace"
  name = "kube-infra"
  description = "Kubernetes-Infrastructure"
}

module "ui_namespace" {
  source = "./modules/kubernetes/namespace"
  name = "ui"
  description = "UI"
}

module "api_namespace" {
  source = "./modules/kubernetes/namespace"
  name = "api"
  description = "API"
}

module "backend_namespace" {
  source = "./modules/kubernetes/namespace"
  name = "backend"
  description = "Backend"
}

# ---------------------------------------------------------------------------------------------------------------------
# Kubernetes Secrets
# ---------------------------------------------------------------------------------------------------------------------

module "docker_pull_secret_config_ui" {
  source = "./modules/kubernetes/secret_docker_config"
  name = "docker-registry"
  namespace = "ui"
  registry_server = azurerm_container_registry.ui.login_server
  registry_username = azurerm_container_registry.ui.admin_username
  registry_password = azurerm_container_registry.ui.admin_password
}

module "docker_pull_secret_config_api" {
  source = "./modules/kubernetes/secret_docker_config"
  name = "docker-registry"
  namespace = "api"
  registry_server = azurerm_container_registry.api.login_server
  registry_username = azurerm_container_registry.api.admin_username
  registry_password = azurerm_container_registry.api.admin_password
}
resource "random_string" "mongodb_password" {
  length  = 12
  special = true
}

module "mongodb_secret" {
  source = "./modules/kubernetes/secret"
  name = "api-main-mongodb"
  namespace = "api"
  key = "mongodb-root-password"
  value = var.mongodb_password
}

module "postgres_secret" {
  source = "./modules/kubernetes/secret"
  name = "backend-main-postgres"
  namespace = "backend"
  key = "POSTGRES_PASSWORD"
  value = var.postgres_password
}

module "cloudflare_secret" {
  source = "./modules/kubernetes/secret"
  name = "cloudflare-dns-credentials"
  namespace = "kube-infra"
  key = "cloudflare_api_key"
  value = var.cloudflare_api_token
}
