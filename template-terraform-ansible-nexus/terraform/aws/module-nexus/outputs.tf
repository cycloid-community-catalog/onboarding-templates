#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = var.create_network ? try(module.vpc[0].vpc_id, null) : try(data.aws_subnet.selected[0].vpc_id, null)
}

output "subnet_id" {
  description = "The VPC ID for the VPC"
  value       = var.create_network ? try(module.vpc[0].public_subnets[0], null) : var.subnet_id
}

#
# Nexus Repository outputs
#
output "vm_ip" {
  description = "The IP address the Nexus Repository EC2 server"
  value       = aws_eip.nexus.public_ip
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = "admin"
}

output "nexus_port" {
  description = "Port where Nexus Repository service is exposed"
  value = var.nexus_port
}

output "nexus_admin_password" {
  description = "Initial admin password in case of first installation"
  value = var.nexus_admin_password
}