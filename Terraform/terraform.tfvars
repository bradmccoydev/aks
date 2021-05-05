kubernetes_version = "1.18.14"
node_disk_size = 30
node_count = 2
node_size = "Standard_B4ms"

kubernetes_network_policy = "calico"
virtual_network_address_prefix = "15.0.0.0/8"
kubernetes_subnet_name = "kubesubnet"
kubernetes_subnet_address_prefix = "15.0.0.0/16"

client_id          = "bradmccoydev" 
project_id         = "reactor-demo"
environment        = "dev"
cloud_location = "Australia East"