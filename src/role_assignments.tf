module "azurerm_role_assignment_k8s_network_primary" {
  source               = "github.com/bradmccoydev/terraform-modules//azurerm/azurerm_role_assignment"
  role_definition_name = "Network Contributor"
  scope                = module.azurerm_kubernetes_cluster_primary.id
  principal_id         = module.azurerm_kubernetes_cluster_primary.principal_id
}

module "azurerm_role_assignment_network_primary" {
  source               = "github.com/bradmccoydev/terraform-modules//azurerm/azurerm_role_assignment"
  role_definition_name = "Network Contributor"
  scope                = module.azurerm_virtual_network_primary.id
  principal_id         = module.azurerm_kubernetes_cluster_primary.principal_id
}
