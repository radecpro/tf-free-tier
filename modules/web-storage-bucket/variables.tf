variable "bucket_name" {
  type        = string
  description = "Name of the GCS bucket to create"
}

variable "bucket_region" {
  type        = string
  description = "Region in which bucket will be created"
}

variable "common_tags" {
  type        = map(string)
  description = "Tags to be applied to bucket"
  default     = {}
}

variable "vm_service_account" {
  type        = string
  description = "Service account email to attach"
}