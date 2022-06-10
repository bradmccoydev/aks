# Client Variables
client_id                   = "ortelius"
client_name                 = "ortelius"
client_project_id           = "gitops"
client_environment          = "prod"
client_project_admin        = "bradmccoydev@gmail.com"
client_budget_amount        = 1000
client_project_repo         = "https://github.com/ortelius/azure-infra"
client_access_groups        = ["9611561b-0599-4b2e-b4e2-a190faa1d388"]
client_project_dependencies = []

# Cloud Variables
cloud_provider                   = "Azure"
cloud_account_id                 = "9860abc8-d98f-4dc1-9f95-483b251a70c7"
cloud_multi_region               = false
cloud_custom_tags                = {}
cloud_transient_instance         = true
cloud_container_registry_enabled = false

cloud_location_1 = {
  name = "Central US"
  alias = "usce"
}

cloud_location_1_bastion_enabled                   = true
cloud_location_1_network_cidr_range_bastion        = "10.0.0.0/16"
cloud_location_1_subnet_cidr_range_bastion_vm      = "10.0.0.0/24"
cloud_location_1_subnet_cidr_range_bastion_service = "10.0.1.0/24"

cloud_location_1_network_cidr_range_kubernetes = "10.1.0.0/16"
cloud_location_1_subnet_public_name_1          = "kubernetes"
cloud_location_1_subnet_public_cidr_1          = "10.1.0.0/21"

kubernetes_node_size          = "Standard_B4ms"
kubernetes_network_policy     = "azure"
kubernetes_node_disk_size     = 30
kubernetes_initial_node_count = 2
kubernetes_max_node_count     = 2

