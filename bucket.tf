resource "google_storage_bucket" "web-storage-bucket" {
  name          = local.gcs_bucket_name
  location      = var.gcs_region
  force_destroy = true

  labels = local.common_tags
}

resource "google_storage_bucket_object" "website" {
  name   = "index.html"
  source = "./website/index.html"
  bucket = google_storage_bucket.web-storage-bucket.name
}

resource "google_storage_bucket_object" "graphic" {
  name   = "logo.png"
  source = "./website/logo.png"
  bucket = google_storage_bucket.web-storage-bucket.name
}