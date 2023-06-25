resource "google_compute_firewall" "custom-allow-ssh" {
  name    = "custom-allow-ssh"
  network = google_compute_network.custom-vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  priority      = "995"
  source_ranges = ["0.0.0.0/0"]
  // Connection via IAP for VMs without external IP
  //source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "custom-allow-internal" {
  name    = "custom-allow-internal"
  network = google_compute_network.custom-vpc.id

  allow {
    protocol = "all"
  }

  priority      = "995"
  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_firewall" "custom-allow-web" {
  name        = "custom-allow-web"
  network     = google_compute_network.custom-vpc.id
  description = "Creates firewall rule targeting frontend instances"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  priority      = "1000"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}