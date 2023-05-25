#
# Resource Group outputs
#
output "rg_name" {
  description = "The name for the resource group"
  value       = data.azurerm_resource_group.nexus.name
}

#
# vNet outputs
#
output "vnet_name" {
  description = "The name for the virtual network"
  value       = azurerm_virtual_network.nexus.name
}

#
# Nexus Repository outputs
#
output "vm_ip" {
  description = "The IP address the Nexus Repository server"
  value       = azurerm_linux_virtual_machine.nexus.public_ip_address
}

output "vm_name" {
  description = "The vm name the Nexus Repository server"
  value       = azurerm_linux_virtual_machine.nexus.name
}

output "nexus_port" {
  description = "Port where Nexus Repository service is exposed"
  value = var.nexus_port
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = var.vm_os_user
}

output "nexus_admin_password" {
  description = "Initial admin password in case of first installation"
  value = var.nexus_admin_password
}