output "client_key" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
}
