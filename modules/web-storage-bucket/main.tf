resource "google_storage_bucket" "web-storage-bucket" {
  name          = var.bucket_name
  location      = var.bucket_region
  force_destroy = true

  labels = var.common_tags
}

resource "google_storage_bucket_iam_binding" "bucket_iam_binding" {
  bucket = google_storage_bucket.web-storage-bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${var.vm_service_account}"
  ]
}