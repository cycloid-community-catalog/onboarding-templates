# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# Infra
variable "vm_machine_type" {
  description = "Machine type for the Nexus Repository"
  default     = "n2-standard-2"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "20"
}