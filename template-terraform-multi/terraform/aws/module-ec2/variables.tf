# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

# NodeJS App
variable "git_app_url" {
  description = "Public git URL of the web application to build and deploy"
  default = "https://github.com/ahfarmer/calculator.git"
}

# Network
variable "subnet_id" {
  description = "Subnet ID where to deploy the EC2 instance."
  default     = ""
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

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH. Set to 'admin' because we use debian OS."
  default     = "admin"
}

variable "keypair_public" {
  description = "Public key to provision to the instance."
  default = ""
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP on the primary interface or not."
  default = true
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