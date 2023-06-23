resource "google_compute_network" "custom-vpc" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "carolina-subnet" {
  name                     = "carolina-subnet"
  ip_cidr_range            = "10.2.0.0/28"
  region                   = "us-east1"
  network                  = google_compute_network.custom-vpc.self_link
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
