output "kube_config" {
    value = format("%s%s%s%s","az aks get-credentials --resource-group ", module.azurerm_resource_group.name, " --name ", local.primary_name)
}
