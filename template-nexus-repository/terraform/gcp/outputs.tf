#
# VPC outputs
#
output "vpc_id" {
  description = "The ID for the VPC network"
  value       = module.nexus.vpc_id
}

output "vpc_name" {
  description = "The name for the VPC network"
  value       = module.nexus.vpc_name
}

output "subnet_id" {
  description = "The ID for the subnet"
  value       = module.nexus.subnet_id
}

output "subnet_name" {
  description = "The name for the subnet"
  value       = module.nexus.subnet_name
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