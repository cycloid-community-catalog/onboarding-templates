output "ssh" {
  description = "The SSH address to connect to the instance"
  value       = "${module.compute.vm_os_user}@${module.compute.vm_public_ip}"
}

output "url" {
  description = "The URL of the wepapp"
  value       = "http://${module.compute.vm_public_ip}"
}

output "instance_id" {
  value = module.compute.instance_id
}

output "vm_os_user" {
  description = "The admin user of the instance"
  value       = module.compute.vm_os_user
}

output "vm_public_ip" {
  description = "The public IP address of the instance"
  value       = module.compute.vm_public_ip
}
