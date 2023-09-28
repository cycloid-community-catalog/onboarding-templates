# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

#
# Bastion
#

variable "bastion_instance_type" {
  description = "Instance type for the bastion"
  default     = "t3.micro"
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH. Set to 'admin' because we use debian OS."
  default     = "admin"
}

variable "keypair_public" {
  description = "The public SSH key, for SSH access to newly-created instances"
}

variable "subnet_id" {
  description = "Subnet ID where to deploy the EC2 instance."
  default     = ""
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