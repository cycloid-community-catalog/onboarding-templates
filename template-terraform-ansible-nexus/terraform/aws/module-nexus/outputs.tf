#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = module.vpc.vpc_id
}

#
# Nexus Repository outputs
#
output "vm_ip" {
  description = "The IP address the Nexus Repository EC2 server"
  value       = aws_instance.nexus.public_ip
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