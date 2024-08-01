# modules/service_connection_policy/outputs.tf
output "id" {
  value       = google_network_connectivity_service_connection_policy.default.id
  description = "ID of the created service connection policy"
}
