resource "google_compute_network" "custom-vpc" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "front-subnet1" {
  name                     = "front-subnet1"
  ip_cidr_range            = var.subnets_range[0]
  region                   = var.subnets_region[0]
  network                  = google_compute_network.custom-vpc.id
  private_ip_google_access = false
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "front-subnet2" {
  name                     = "front-subnet2"
  ip_cidr_range            = var.subnets_range[1]
  region                   = var.subnets_region[1]
  network                  = google_compute_network.custom-vpc.id
  private_ip_google_access = false
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}