output "kube_config" {
    value = format("%s%s%s%s","az aks get-credentials --resource-group ", module.azurerm_resource_group.name, " --name ", module.azurerm_kubernetes_cluster_primary.host)
}
