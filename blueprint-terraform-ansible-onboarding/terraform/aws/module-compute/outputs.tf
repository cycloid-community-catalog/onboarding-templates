output "vm_public_ip" {
  description = "The IP address the EC2 instance"
  value       = data.aws_instance.ec2.public_ip
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = var.vm_os_user
}

output "instance_id" {
  value = data.aws_instance.ec2.id
}