#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = aws_vpc.infra.id
}

output "vpc_cidr" {
  description = "The CIDR for the VPC"
  value       = var.vpc_cidr
}

output "vpc_public_subnet" {
  description = "The public subnet for the VPC"
  value       = var.vpc_public_subnet
}

output "vpc_private_subnet" {
  description = "The private subnet for the VPC"
  value       = var.vpc_private_subnet
}