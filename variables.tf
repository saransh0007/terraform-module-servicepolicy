resource "google_network_connectivity_service_connection_policy" "default" {
  name          = var.name
  location      = var.location
  service_class = var.service_class
  network       = var.network

  dynamic "psc_config" {
    for_each = var.psc_config
    content {
      subnetworks = psc_config.value.subnetworks
      limit       = psc_config.value.limit
    }
  }
}

# modules/service_connection_policy/variables.tf
variable "name" {
  type        = string
  description = "Name of the service connection policy"
  default     = "service-connection-policy"
}

variable "location" {
  type        = string
  description = "Location of the service connection policy"
  default     = "us-central1"
}

variable "service_class" {
  type        = string
  description = "Service class of the policy (e.g., 'gcp-memorystore-redis')"
  default     = "gcp-memorystore-redis"
}

variable "network" {
  type        = string
  description = "Network ID to attach the policy to"
}

variable "psc_config" {
  type = list(object({
    subnetworks = list(string)
    limit       = number
  }))
  description = "List of PSC configurations (subnetworks and limits)"
  default     = [{ subnetworks = [], limit = null }]
}