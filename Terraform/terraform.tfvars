kubernetes_version = "1.18.14"
node_disk_size = 30
node_count = 2
node_size = "Standard_B4ms"

kubernetes_network_policy = "calico"
virtual_network_address_prefix = "15.0.0.0/8"
kubernetes_subnet_name = "kubesubnet"
kubernetes_subnet_address_prefix = "15.0.0.0/16"
appgateway_subnet_name = "appgwsubnet"
app_gateway_subnet_address_prefix = "15.1.0.0/16"

namespaces = [ "kube-infra","ui","api" ]
api_container_name = "api"
ui_container_name = "ui"

cloud_partner_id   = "67eca6ce-fdb4-4acd-8101-123c19c92724"
client_id          = "bradmccoydev" 
project_id         = "self-service"
environment        = "dev"
cloud_location = "Australia East"

