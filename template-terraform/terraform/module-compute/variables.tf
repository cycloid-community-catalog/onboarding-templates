# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# AWS
variable "aws_region" {
  description = "AWS region where to deploy the resources."
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