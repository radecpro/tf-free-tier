resource "google_compute_instance" "nginx-web" {
  name         = "${local.naming_prefix}-${var.instance_name}-${count.index + 1}"
  machine_type = var.instance_type
  zone         = var.instance_zone[count.index]
  count        = var.instance_count

  tags                      = ["web"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      size  = 15
      type  = "pd-standard"
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = templatefile("${path.module}/nginx-startup.sh", {
    bucket_name = google_storage_bucket.web-storage-bucket.name
  })

  network_interface {
    network    = google_compute_network.custom-vpc.id
    subnetwork = google_compute_subnetwork.front-subnets[(count.index % var.subnets_count)].id
    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    email  = google_service_account.vm-gcs-sa.email
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only"]
  }

  labels = local.common_tags

  lifecycle {
    ignore_changes = [metadata["ssh-keys"]]
  }
}