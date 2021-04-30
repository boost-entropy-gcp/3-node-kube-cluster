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

output "vm-instance-1-ip" {
   value = google_compute_instance.vm_instance_1.network_interface.0.access_config.0.nat_ip
}
output "vm-instance-1-internal-ip" {
   value = google_compute_instance.vm_instance_1.network_interface.0.network_ip
}
output "vm-instance-2-ip" {
   value = google_compute_instance.vm_instance_2.network_interface.0.access_config.0.nat_ip
}
output "vm-instance-2-internal-ip" {
   value = google_compute_instance.vm_instance_2.network_interface.0.network_ip
}
output "vm-instance-3-ip" {
   value = google_compute_instance.vm_instance_3.network_interface.0.access_config.0.nat_ip
}
output "vm-instance-3-internal-ip" {
   value = google_compute_instance.vm_instance_3.network_interface.0.network_ip
}
