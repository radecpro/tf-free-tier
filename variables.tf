variable "gcp_region" {
  type        = string
  description = "GCP region to use for resources"
  default     = "us-east1"
}

variable "gcp_zone" {
  type        = string
  description = "GCP zone to use for resources"
  default     = "us-east1-c"
}

variable "instance_name" {
  type        = string
  description = "Name for the Google Compute instance"
}

variable "instance_type" {
  type        = string
  description = "Machine type of the Google Compute instance"
  default     = "e2-micro"
}

variable "instance_zone" {
  type        = string
  description = "Zone for the Google Compute instance"
  default     = "us-east1-c"
}

variable "subnet_range" {
  type        = string
  description = "IP CIDR range of VPC subnet"
  default     = "10.10.0.0/28"
}

variable "subnet_region" {
  type        = string
  description = "Region of VPC subnet"
  default     = "us-east1"
}