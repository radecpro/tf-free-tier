resource "google_compute_network" "custom-vpc" {
  name                    = "${local.naming_prefix}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "front-subnets" {
  name                     = "${local.naming_prefix}-front-subnet-${count.index + 1}"
  ip_cidr_range            = cidrsubnet(var.vpc_cidr_range, 8, count.index)
  region                   = var.subnets_region[(count.index % 2)]
  count                    = var.subnets_count
  network                  = google_compute_network.custom-vpc.id
  private_ip_google_access = false
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}