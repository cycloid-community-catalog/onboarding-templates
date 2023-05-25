#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = module.nexus.vpc_id
}

#
# Nexus Repository outputs
#
output "vm_ip" {
  description = "The IP address the Nexus Repository server"
  value       = module.nexus.vm_ip
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