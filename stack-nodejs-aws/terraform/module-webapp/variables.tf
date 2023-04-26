# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

# NodeJS App
variable "git_app_url" {
  description = "Public git URL of the web application to build and deploy"
  default = ""
}

# Infra
variable "vm_instance_type" {
  description = "Instance type to deploy."
  default     = "t3a.small"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "20"
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