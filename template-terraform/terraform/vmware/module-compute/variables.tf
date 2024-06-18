# Cycloid
variable "customer" {}
variable "env" {}
variable "project" {}

#
# vSphere
#
variable "vsphere_datacenter" {
  description = "Datacenter where to create the virtual machine"
  default     = "dc1"
}

variable "vsphere_datastore" {
  description = "Datastore where to create the virtual machine"
  default     = "datastore1"
}

variable "vsphere_cluster" {
  description = "Cluster where to create the virtual machine"
  default     = "cluster1"
}

variable "vsphere_template" {
  description = "Virtual machine template"
  default     = "debian-9"
}

variable "vsphere_network" {
  description = "Network where to create the virtual machine"
  default     = "VM Network"
}


#
# VM
#

variable "vm_name" {
  description = "Name of the virtual machine"
  default     = "${var.project}-${var.env}"
}

variable "vm_ip" {
  description = "IP address of the virtual machine"
  default     = "212.129.18.92"
}

variable "vm_mac" {
  description = "MAC address of the virtual machine"
  default     = "00:50:56:01:f1:96"
}

variable "vm_cpu" {
  description = "Number of vCPU allocated to the virtual machine"
  default     = "2"
}

variable "vm_memory" {
  description = "Memory allocated to the virtual machine (Mo)"
  default     = "2048"
}

variable "vm_disk_size" {
  description = "Disk size allocated to the virtual machine (Go)"
  default = "20"
}