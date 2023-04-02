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
