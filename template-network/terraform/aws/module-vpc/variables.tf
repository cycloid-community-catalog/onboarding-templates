# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

#
# VPC
#
variable "vpc_cidr" {
  type        = string
  description = "The CIDR of the VPC."
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet" {
  type        = string
  description = "The public subnet for the VPC."
  default     = "10.0.0.0/24"
}

variable "vpc_private_subnet" {
  type        = string
  description = "The private subnet for the VPC."
  default     = "10.0.1.0/24"
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloid.io" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}