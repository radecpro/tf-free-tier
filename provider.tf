provider "google" {
  project = "banded-arcana-369922"
  region  = var.gcp_region
  zone    = var.gcp_zone
}

provider "random" {
  # Configuration options
}