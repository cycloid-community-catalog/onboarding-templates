#
# Resource Group outputs
#
output "rg_name" {
  description = "The name for the Resource Group"
  value       = module.nexus.rg_name
}

#
# vNet outputs
#
output "vnet_name" {
  description = "The name for the virtual network"
  value       = module.nexus.vnet_name
}

#
# Nexus Repository outputs
#
output "vm_ip" {
  description = "The IP address the Nexus Repository server"
  value       = module.nexus.vm_ip
}

output "vm_name" {
  description = "The vm name the Nexus Repository server"
  value       = module.nexus.vm_name
}

output "nexus_port" {
  description = "Port where Nexus Repository service is exposed"
  value       = module.nexus.nexus_port
}

output "vm_os_user" {
  description = "The username to use to connect to the Nexus Repository instance via SSH."
  value       = module.nexus.vm_os_user
}

output "nexus_admin_password" {
  description = "Initial admin password in case of first installation."
  value       = module.nexus.nexus_admin_password
}

