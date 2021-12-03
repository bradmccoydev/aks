module "random_string_suffix" {
  source         = "github.com/bradmccoydev/terraform-modules-modules.git//utils/random_string"
  length         = 4
  special        = false
  contains_upper = false
}

module "tls_private_key" {
  source  = "github.com/bradmccoydev/terraform-modules-modules.git//utils/tls_private_key"
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "azuread_application" "aks_sp" {
  name = "${var.client_id}-${var.project_id}"
}

resource "azuread_service_principal" "aks_sp" {
  application_id = azuread_application.aks_sp.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "aks_sp" {
  service_principal_id = azuread_service_principal.aks_sp.id
  value                = random_string.aks_sp_secret.result
  end_date_relative    = "8760h" # 1 year

  lifecycle {
    ignore_changes = [
      value,
      end_date_relative
    ]
  }
}

resource "azuread_application_password" "aks_sp" {
  application_object_id = azuread_application.aks_sp.id
  value                 = random_string.aks_sp_secret.result
  end_date_relative     = "8760h" # 1 year

  lifecycle {
    ignore_changes = [
      value,
      end_date_relative
    ]
  }
}