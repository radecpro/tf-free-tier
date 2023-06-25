resource "google_compute_instance" "nginx-web-1" {
  name         = "nginx-web-1"
  machine_type = "e2-micro"
  zone         = "us-east1-c"

  tags = ["web"]

  boot_disk {
    initialize_params {
      size  = 15
      type  = "pd-standard"
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = file("./nginx-startup.sh")

  network_interface {
    network    = google_compute_network.custom-vpc.id
    subnetwork = google_compute_subnetwork.carolina-subnet.id
    access_config {
      // Ephemeral public IP
    }
  }
}