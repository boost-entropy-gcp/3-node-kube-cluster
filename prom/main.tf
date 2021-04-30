provider "google" {
    credentials = file("cred.json")
    project     = var.project_id
    region      = var.region
}
# PROM
resource "google_compute_instance" "vm_instance_4" {
    name         = "prometeus"
    machine_type = "e2-small"
    zone         = var.zone

    boot_disk {
       initialize_params {
       image = "centos-cloud/centos-7"
   }
 }
    metadata = {
       ssh-keys = "ec2-user:${file("~/.ssh/id_rsa.pub")}"
    }
    network_interface {
       network    = "${var.project_id}-vpc"
       subnetwork = "${var.project_id}-subnet"
       access_config {
       }
    }
}

