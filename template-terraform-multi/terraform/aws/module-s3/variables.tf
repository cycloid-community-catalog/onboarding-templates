# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

# Storage
variable "s3_bucket_name" {
  description = "S3 bucket name."
  default     = ""
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloid" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}