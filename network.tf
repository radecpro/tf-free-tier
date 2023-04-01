resource "google_compute_network" "custom-vpc" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "iowa-subnet" {
  name                     = "iowa-subnet"
  ip_cidr_range            = "10.2.0.0/28"
  network                  = google_compute_network.custom-vpc.self_link
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "custom-allow-ssh-iap" {
  name    = "custom-allow-ssh-iap"
  network = google_compute_network.custom-vpc.self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  priority      = "995"
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "custom-allow-internal" {
  name    = "custom-allow-internal"
  network = google_compute_network.custom-vpc.self_link
  allow {
    protocol = "all"
  }
  priority      = "995"
  source_ranges = ["10.0.0.0/8"]
}