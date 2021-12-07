locals {
  tags = {
    environment = var.client_environment
    owner       = var.client_id
    repo        = var.client_project_repo
    project     = var.client_project_id
  }

  shared_name    = "${var.client_project_id}-${var.client_environment}"
  primary_name   = "${var.client_project_id}-${var.cloud_location_1.alias}-${var.client_environment}"
  secondary_name = "${var.client_project_id}-${var.cloud_location_2.alias}-${var.client_environment}"
}
