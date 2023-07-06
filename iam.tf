resource "google_service_account" "vm-gcs-sa" {
  account_id   = "vm-gcs-sa"
  display_name = "VM to GCS connector"
  description  = "VM service account to access GCS bucket"
}

resource "google_storage_bucket_iam_binding" "bucket_iam_binding" {
  bucket = google_storage_bucket.web-storage-bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.vm-gcs-sa.email}"
  ]
}