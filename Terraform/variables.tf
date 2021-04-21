# ---------------------------------------------------------------------------------------------------------------------
# Secrets
# ---------------------------------------------------------------------------------------------------------------------

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  sensitive   = true
}

variable "mongodb_password" {
  description = "MongoDB Password"
  sensitive   = true
}

variable "postgres_password" {
  description = "Postgres SQL Password"
  sensitive   = true
}

# ---------------------------------------------------------------------------------------------------------------------
# Kubernetes & Containers
# ---------------------------------------------------------------------------------------------------------------------

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.18.14"
}

variable "kubernetes_network_policy" {
  description = "Kubernetes Network Policy."
}

variable "node_disk_size" {
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 30
}

variable "node_count" {
  description = "The number of agent nodes for the cluster."
}

variable "node_size" {
  description = "VM size"
}

variable "namespaces" {
  description = "Kubernetes Namespaces"
}

variable "api_container_name" {
  description = "Api Container Name."
}

variable "ui_container_name" {
  description = "UI Container Name."
}

# ---------------------------------------------------------------------------------------------------------------------
# Project
# ---------------------------------------------------------------------------------------------------------------------

variable "cloud_partner_id" {
  description = "Azure Partner ID."
}

variable "client_id" {
  description = "Client ID ."
}

variable "project_id" {
  description = "Project ID ."
}

variable "environment" {
  description = "Environment."
}

# ---------------------------------------------------------------------------------------------------------------------
# Network
# ---------------------------------------------------------------------------------------------------------------------

variable "cloud_location" {
  description = "Location of the cluster."
  default = "Australia East"
}

variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "aksVirtualNetwork"
}

variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
}

variable "kubernetes_subnet_name" {
  description = "Subnet Name."
}

variable "kubernetes_subnet_address_prefix" {
  description = "Subnet address prefix."
}

variable "appgateway_subnet_name" {
  description = "App Gateway Subnet Name."
}

variable "app_gateway_subnet_address_prefix" {
  description = "Subnet server IP address."
}

variable "app_gateway_name" {
  description = "Name of the Application Gateway"
  default = "ApplicationGateway"
}

variable "app_gateway_sku" {
  description = "Name of the Application Gateway SKU"
  default = "Standard_v2"
}

variable "app_gateway_tier" {
  description = "Tier of the Application Gateway tier"
  default = "Standard_v2"
}

variable "kubernetes_service_cidr" {
  description = "CIDR notation IP range from which to assign service cluster IPs"
  default     = "10.0.0.0/16"
}

variable "kubernetes_dns_service_ip" {
  description = "DNS server IP address"
  default     = "10.0.0.10"
}

variable "kubernetes_docker_bridge_cidr" {
  description = "CIDR notation IP for Docker bridge."
  default     = "172.17.0.1/16"
}

variable "kubernetes_enable_rbac" {
  description = "Enable RBAC on the AKS cluster. Defaults to false."
  default     = "false"
}

variable "vm_user_name" {
  description = "User name for the VM"
  default     = "bmccoy"
}

variable "public_ssh_key_path" {
  description = "Public key path for SSH."
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
    application = "bradmccoydev"
    owner = "bradmccoydev@gmail.com"
    environment = "Dev"
  }
}