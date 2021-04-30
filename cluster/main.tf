provider "google" {
    credentials = file("cred.json")
    project     = var.project_id
    region      = var.region
}
# MASTER
resource "google_compute_instance" "vm_instance_1" {
    name         = "kuber-vm-instance-1"
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
       network    = google_compute_network.vpc.name
       subnetwork = google_compute_subnetwork.subnet.name
       access_config {
       }
    }
}

# NODE 1
resource "google_compute_instance" "vm_instance_2" {
    name         = "kuber-vm-instance-2"
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
       network    = google_compute_network.vpc.name
       subnetwork = google_compute_subnetwork.subnet.name
       access_config {
       }
    }
}


# NODE 2
resource "google_compute_instance" "vm_instance_3" {
    name         = "kuber-vm-instance-3"
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
       network    = google_compute_network.vpc.name
       subnetwork = google_compute_subnetwork.subnet.name
       access_config {
       }
    }
}



