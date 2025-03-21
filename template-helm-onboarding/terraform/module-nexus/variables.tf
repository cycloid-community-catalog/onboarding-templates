# Cycloid
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

#
# Nexus Repository
#
variable "vm_disk_size" {
  description = "Disk size for the Nexus Repository (Go)"
  default = "10"
}

variable "nexus_port" {
  description = "Port where Nexus Repository service is exposed"
  default = "8081"
}