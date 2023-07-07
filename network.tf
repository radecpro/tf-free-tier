resource "google_compute_network" "custom-vpc" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "front-subnets" {
  name                     = "front-subnet-${count.index + 1}"
  ip_cidr_range            = var.subnets_range[count.index]
  region                   = var.subnets_region[count.index]
  count                    = var.subnets_count
  network                  = google_compute_network.custom-vpc.id
  private_ip_google_access = false
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}