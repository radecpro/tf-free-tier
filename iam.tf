resource "google_service_account" "vm-gcs-sa" {
  account_id   = "vm-gcs-sa"
  display_name = "VM to GCS connector"
  description  = "VM service account to access GCS bucket"
}