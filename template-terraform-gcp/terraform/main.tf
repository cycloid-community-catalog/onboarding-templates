module "compute" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-compute"
  cyorg  = var.cyorg
  cypro  = var.cypro
  cyenv  = var.cyenv
  cycom  = var.cycom
  #####################################

  ### Change the terraform HCL in module-compute according to your needs.
  ### Here below, add the variables coming from .forms.yml file when technology is terraform to pass them to the compute module.

  #. vm_instance_type: 'n2-standard-2'
  #+ Machine type for the VM
  vm_machine_type = ""

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = ""
}