#
# Instance outputs
#
output "ssh_url" {
  description = "The SSH URL to connect to the instance"
  value       = "${module.webapp.vm_os_user}@${module.webapp.vm_ip}"
}

output "http_url" {
  description = "The HTTP URL of the wepapp"
  value       = "http://${module.webapp.vm_ip}"
}