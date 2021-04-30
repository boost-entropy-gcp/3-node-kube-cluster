output "region" {
  value       = var.region
  description = "gcloud region"
}
output "zone" {
  value       = var.zone
  description = "GCloud zone"
}
output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "vm--ip" {
   value = google_compute_instance.vm_instance_4.network_interface.0.access_config.0.nat_ip
}
output "vm--internal-ip" {
   value = google_compute_instance.vm_instance_4.network_interface.0.network_ip
}
