resource "google_compute_network" "custom-vpc" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "front-subnet" {
  name                     = "front-subnet"
  ip_cidr_range            = var.subnet_range
  region                   = var.subnet_region
  network                  = google_compute_network.custom-vpc.id
  private_ip_google_access = false
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
