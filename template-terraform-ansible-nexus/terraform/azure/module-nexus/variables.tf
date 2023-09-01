# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

# Keypair
variable "keypair_public" {
  description = "The public SSH key, for SSH access to newly-created instances"
}

variable "azure_location" {
  description = "Azure location"
  default = "West Europe"
}


#
# Nexus Repository
#
variable "rg_name" {
  type        = string
  description = "The name of the existing resource group where the resources will be deployed."
  default     = "cycloid-get-started"
}

variable "vm_instance_type" {
  description = "Instance type for the Nexus Repository"
  default     = "Standard_DS1_v2"
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  default     = "nexus"
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
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}