# modules/service_connection_policy/variables.tf
variable "name" {
  type        = string
  description = "Name of the service connection policy"
}

variable "location" {
  type        = string
  description = "Location of the service connection policy"
}

variable "service_class" {
  type        = string
  description = "Service class of the policy (e.g., 'gcp-memorystore-redis')"
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
