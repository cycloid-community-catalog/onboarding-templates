#
# Instance outputs
#
output "vm_ip" {
  description = "The IP address the EC2 instance"
  value       = aws_instance.webapp.public_ip
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = var.vm_os_user
}