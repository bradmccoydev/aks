variable "client_id" {
  description = "Client ID"
  validation {
    condition     = length(var.client_id) > 1 && length(var.client_id) < 12
    error_message = "Client_id must be > 1 && < 12 characters."
  }
}

variable "client_name" {
  description = "Client Name"
  validation {
    condition     = length(var.client_name) > 3 && length(var.client_name) < 13
    error_message = "Client_name must be > 3 && < 13 characters."
  }
}

variable "client_project_id" {
  description = "Project ID"
}

variable "client_environment" {
  description = "Environment eg dev"
}

variable "client_project_admin" {
  type        = string
  description = "The Client Project Admin"
}
variable "client_budget_amount" {
  description = "Monthly budget amount in AUD."
  type = number
}

variable "client_project_repo" {
  description = "Project source control repository"
}

variable "client_access_groups" {
  description = "Client Access Groups"
  default = []
}
variable "client_project_dependencies" {
  description = "Project dependencies"
  type        = list(string)
}

variable "cloud_tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "cloud_account_id" {
  description = "Subscription ID"
  type        = string
}

variable "cloud_multi_region" {
  description = "Cloud Multi Region Region Required"
  type        = bool
}

variable "cloud_location_1" {
  description = "Cloud Location (region)"
}

variable "cloud_location_2" {
  description = "Cloud Location (region)"
}

variable "cloud_partner_id" {
  description = "Cloud partner id"
  type        = string

  validation {
    condition     = length(split("-", var.cloud_partner_id)[0]) == 8 && length(split("-", var.cloud_partner_id)[1]) == 4 && length(split("-", var.cloud_partner_id)[2]) == 4 && length(split("-", var.cloud_partner_id)[3]) == 4 && length(split("-", var.cloud_partner_id)[4]) == 12
    error_message = "Cloud_partner_id must be in this format: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX (8-4-4-4-12)."
  }
}

variable "cloud_transient_instance" {
  description = "The environment"
}

variable "cloud_custom_tags" {
  type = map(string)
}

variable "cloud_provider" {
  type        = string
  description = "The Cloud Provider [ AWS, Azure, GCP ]"
}

variable "cloud_container_registry_enabled" {
  description = "Container Registry Enabled"
}

# Cloud Location 1
variable "cloud_location_1_bastion_enabled" {
  description = "Cloud Bastion Enabled"
}
variable "cloud_location_1_network_cidr_range_bastion" {
  type        = string
  description = "Cloud Network CIDR Range"
}

variable "cloud_location_1_subnet_cidr_range_bastion_vm" {
  type        = string
  description = "Cloud Subnet Cidr Range Bastion VM"
}

variable "cloud_location_1_subnet_cidr_range_bastion_service" {
  type        = string
  description = "Cloud Subnet Cidr Range Bastion Service"
}

variable "cloud_location_1_network_cidr_range_kubernetes" {
  type        = string
  description = "Cloud Network CIDR Range"
}

variable "cloud_location_1_subnet_public_name_1" {
  type        = string
  description = "Cloud Location"
}

variable "cloud_location_1_subnet_public_cidr_1" {
  type        = string
  description = "Cloud Location"
}

# Kubernetes

variable "kubernetes_node_size" {
  type        = string
  description = "Cloud Location"
}

variable "kubernetes_network_policy" {
  type        = string
  description = "Cloud Location"
}

variable "kubernetes_node_disk_size" {
  type        = string
  description = "Cloud Location"
}

variable "kubernetes_initial_node_count" {
  type        = string
  description = "Cloud Location"
}

variable "kubernetes_max_node_count" {
  type        = string
  description = "Cloud Location"
}
