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

variable "gcs_region" {
  type        = string
  description = "Location of the GCS bucket"
  default     = "US-EAST1"
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
  type        = list(string)
  description = "Zone for the Google Compute instance"
  default     = ["us-east1-c", "us-central1-f"]
}

variable "instance_count" {
  type        = number
  description = "Number of Google Compute instances"
  default     = 1
}

variable "vpc_cidr_range" {
  type        = string
  description = "IP CIDR range of VPC network"
  default     = "10.10.0.0/16"
}

variable "subnets_region" {
  type        = list(string)
  description = "Region of VPC subnets"
  default     = ["us-east1", "us-central1"]
}

variable "subnets_count" {
  type        = number
  description = "Number of subnets to create"
  default     = 1
}

variable "company_tag" {
  type        = string
  description = "Company name for resource tagging"
}

variable "project_tag" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_tag" {
  type        = string
  description = "Billing code for resource tagging"
}

variable "naming_prefix" {
  type        = string
  description = "Naming prefix for all resources"
}

variable "environment" {
  type        = string
  description = "Environment for the resources"
  default     = "dev"
}