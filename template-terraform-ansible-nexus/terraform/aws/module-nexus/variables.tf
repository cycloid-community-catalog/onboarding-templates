# Cycloid
variable "customer" {}
variable "project" {}
variable "env" {}

# Keypair
variable "keypair_public" {
  description = "The public SSH key, for SSH access to newly-created instances"
}

#
# Nexus Repository
#
variable "vm_instance_type" {
  description = "Instance type for the Nexus Repository"
  default     = "t3.micro"
}

variable "vm_disk_size" {
  description = "Disk size for the Nexus Repository (Go)"
  default = "20"
}

variable "nexus_port" {
  description = "Port where Nexus Repository service is exposed"
  default = "8081"
}

variable "nexus_admin_password" {
  description = "Initial admin password in case of first installation."
  default = "changeme"
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloid"    = "true"
    customer     = var.customer
    project      = var.project
    env          = var.env
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}