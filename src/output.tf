output "client_certificate" {
  value     = module.azurerm_kubernetes_cluster_primary.client_certificate
  sensitive = true
}

output "kube_config_command" {
    value = format("%s%s%s%s","az aks get-credentials --resource-group ", module.azurerm_resource_group.name, " --name ", local.primary_name)
}
