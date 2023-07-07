locals {
  common_tags = {
    company     = var.company_tag
    project     = "${var.company_tag}-${var.project_tag}"
    billing     = var.billing_tag
    environment = var.environment
  }

  gcs_bucket_name = "${lower(local.naming_prefix)}-${random_integer.gcs.result}"

  website_content = {
    website = "website/index.html"
    logo    = "website/logo.png"
  }

  naming_prefix = "${var.naming_prefix}-${var.environment}"
}

resource "random_integer" "gcs" {
  min = 10000
  max = 99999
}