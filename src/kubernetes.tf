resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "${var.client_id}-${var.project_id}-${var.environment}"
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = "aks"
    kubernetes_version = var.kubernetes_version

    linux_profile {
        admin_username = var.vm_user_name

        ssh_key {
            key_data = tls_private_key.default.public_key_openssh
        }
    }

    node_resource_group = "${var.client_id}-${var.project_id}-${var.environment}-node"

    default_node_pool {
      name            = "agentpool"
      node_count      = var.node_count
      vm_size         = var.node_size
      os_disk_size_gb = var.node_disk_size
      vnet_subnet_id  = data.azurerm_subnet.kubesubnet.id
    }

    role_based_access_control {
      enabled = true
    }

    addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

    service_principal {
      client_id     = azuread_service_principal.aks_sp.application_id
      client_secret = random_string.aks_sp_secret.result
    }

    network_profile {
      network_plugin = "kubenet"
      network_policy = var.kubernetes_network_policy
    }

    depends_on = [azurerm_virtual_network.k8s]
    tags       = var.tags
}