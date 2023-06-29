locals {
  common_tags = {
    company = var.company_tag
    project = "${var.company_tag}-${var.project_tag}"
    billing = var.billing_tag
  }
}

resource "random_integer" "gcs" {
  min = 10000
  max = 99999
}