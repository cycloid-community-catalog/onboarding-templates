#
# VM outputs
#
output "vm_id" {
  description = "The UUID of the virtual machine"
  value       = vsphere_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of this virtual machine"
  value       = var.vm_name
}

output "vm_ip" {
  description = "The IP address of this virtual machine"
  value       = var.vm_ip
}

output "vm_mac" {
  description = "The MAC address of this virtual machine"
  value       = var.vm_mac
}