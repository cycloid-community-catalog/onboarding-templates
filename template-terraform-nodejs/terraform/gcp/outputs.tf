#
# VPC outputs
#
output "vpc_id" {
  description = "The VPC ID for the VPC"
  value       = module.webapp.vpc_id
}

#
# Instance outputs
#
output "url" {
  description = "The URL of the wepapp"
  value       = "http://${module.webapp.vm_ip}"
}