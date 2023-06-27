resource "google_compute_instance" "nginx-web" {
  name         = "${var.instance_name}-${count.index + 1}"
  machine_type = var.instance_type
  zone         = var.instance_zone
  count        = var.instance_count

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
    subnetwork = google_compute_subnetwork.front-subnet.id
    access_config {
      // Ephemeral public IP
    }
  }

  labels = local.common_tags

  lifecycle {
    ignore_changes = [metadata["ssh-keys"]]
  }
}