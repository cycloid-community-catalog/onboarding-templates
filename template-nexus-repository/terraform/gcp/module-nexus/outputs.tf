#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = google_compute_network.nexus.id
}

output "vpc_name" {
  description = "The name for the VPC"
  value       = google_compute_network.nexus.name
}

output "subnet_id" {
  description = "The ID for the subnet"
  value       = google_compute_subnetwork.nexus.id
}

output "subnet_name" {
  description = "The name for the subnet"
  value       = google_compute_subnetwork.nexus.name
}

#
# Nexus Repository outputs
#
output "vm_ip" {
  description = "The IP address the Nexus Repository EC2 server"
  value       = google_compute_instance.nexus.network_interface.0.access_config.0.nat_ip
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = var.vm_os_user
}

output "nexus_port" {
  description = "Port where Nexus Repository service is exposed"
  value       = var.nexus_port
}

output "nexus_admin_password" {
  description = "Initial admin password in case of first installation"
  value       = var.nexus_admin_password
}