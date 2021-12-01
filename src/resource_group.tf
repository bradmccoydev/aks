resource "azurerm_resource_group" "k8s" {
    name     = "${var.client_id}-${var.project_id}-${var.environment}"
    location = var.cloud_location
}