# Cycloid
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

# Infra
variable "vm_machine_type" {
  description = "Machine type for the Nexus Repository"
  default     = "n2-standard-2"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "20"
}