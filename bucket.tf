module "web-storage-bucket" {
  source = "./modules/web-storage-bucket"

  bucket_name        = local.gcs_bucket_name
  bucket_region      = var.gcs_region
  common_tags        = local.common_tags
  vm_service_account = google_service_account.vm-gcs-sa.email
}

resource "google_storage_bucket_object" "website-content" {
  for_each = local.website_content
  name     = each.value
  source   = "${path.root}/${each.value}"
  bucket   = module.web-storage-bucket.web-bucket.name
}