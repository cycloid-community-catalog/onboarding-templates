# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# Infra
variable "vm_instance_type" {
  description = "Instance type to deploy."
  default     = "Standard_DS2_v2"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "30"
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH. 'admin' is not allowed by Azure."
  default     = "cycloid"
}

variable "azure_location" {
  description = "Azure location"
}
