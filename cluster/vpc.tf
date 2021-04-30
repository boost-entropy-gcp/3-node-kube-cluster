# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
# Firewall
resource "google_compute_firewall" "default" {
  name    = "firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
 }
  allow {
    protocol = "tcp"
    ports = ["6443","2379","2380","10250-10252","30000-32767","22","3000","9090","9100","4422"]
 }
  allow {
    protocol = "udp"
    ports = ["8285","8472"]
  }
}

