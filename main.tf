# modules/service_connection_policy/main.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
  
    }
  }
}

resource "google_network_connectivity_service_connection_policy" "default" {
  name          = var.name
  location      = var.location
  service_class = var.service_class
  network       = var.network
  project       = var.project_id

  dynamic "psc_config" {
    for_each = var.psc_config
    content {
      subnetworks = psc_config.value.subnetworks
      limit       = psc_config.value.limit
    }
  }

 lifecycle {
    depends_on = [
       google_network_connectivity_service_connection.default.psc_connections]
    ]
  }

}
