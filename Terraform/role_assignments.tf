resource "azurerm_role_assignment" "kubapi_to_acr" {
  scope                = azurerm_container_registry.ui.id
  role_definition_name = "AcrPull"
  principal_id         = azuread_service_principal.aks_sp.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = azurerm_container_registry.api.id
  role_definition_name = "AcrPull"
  principal_id         = azuread_service_principal.aks_sp.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "network" {
  scope                = azurerm_kubernetes_cluster.k8s.id
  role_definition_name = "Network Contributor"
  principal_id         = azuread_service_principal.aks_sp.object_id
}

resource "azurerm_role_assignment" "net_contributor_subnet" {
  role_definition_name = "Network Contributor"
  scope                = azurerm_virtual_network.k8s.id
  principal_id         = azuread_service_principal.aks_sp.object_id
}