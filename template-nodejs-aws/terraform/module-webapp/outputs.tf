#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = module.vpc.vpc_id
}

#
# Instance outputs
#
output "vm_ip" {
  description = "The IP address the EC2 instance"
  value       = aws_instance.webapp.public_ip
}