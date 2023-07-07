resource "google_storage_bucket" "web-storage-bucket" {
  name          = local.gcs_bucket_name
  location      = var.gcs_region
  force_destroy = true

  labels = local.common_tags
}

resource "google_storage_bucket_object" "website-content" {
  for_each = local.website_content
  name     = each.value
  source   = "${path.root}/${each.value}"
  bucket   = google_storage_bucket.web-storage-bucket.name
}