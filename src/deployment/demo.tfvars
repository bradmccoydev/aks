# Client Variables
client_id                   = "hashicorp"
client_name                 = "hashicorp"
client_project_id           = "tf"
client_environment          = "prod"
client_project_admin        = "bradmccoydev@gmail.com"
client_budget_amount        = 0
client_project_repo         = "https://github.com/ortelius/ortelius-kubernetes"
client_access_groups        = ["9611561b-0599-4b2e-b4e2-a190faa1d388"]
client_project_dependencies = []

# Cloud Variables
cloud_provider              = "Azure"
cloud_tenant_id             = "57ebf52b-400a-4db6-a524-b07f4888055a"
cloud_account_id            = "57b482cf-3355-4f0c-8adb-6d6bbb1b2cf7"
cloud_multi_region          = false
cloud_custom_tags           = {}
cloud_credentials           = "./deployment/ortelius/devops/backend-gcp.json"
cloud_transient_instance    = true
cloud_container_registry_enabled = false

cloud_location_1_bastion_enabled                    = true
cloud_location_1_network_cidr_range_bastion         = "10.0.0.0/16"
cloud_location_1_subnet_cidr_range_bastion_vm       = "10.0.0.0/24"
cloud_location_1_subnet_cidr_range_bastion_service  = "10.0.1.0/24"

cloud_location_1_network_cidr_range_kubernetes = "10.1.0.0/16"
cloud_location_1_subnet_public_name_1          = "kubernetes"
cloud_location_1_subnet_public_cidr_1          = "10.1.10.0/24"
