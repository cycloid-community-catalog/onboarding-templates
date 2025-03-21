module "compute" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-compute"
  cy_org  = var.cy_org
  cy_pro  = var.cy_pro
  cy_env  = var.cy_env
  cy_com  = var.cy_com
  #####################################

  ### Change the terraform HCL in module-compute according to your needs.
  ### Here below, add the variables coming from .forms.yml file when technology is terraform to pass them to the compute module.

  #. vm_instance_type: 'Standard_DS2_v2'
  #+ Instance type for the VM
  vm_instance_type = ""

  #. vm_disk_size: 30
  #+ Disk size for the VM (Go)
  vm_disk_size = 30

  #. azure_location: ""
  #+ Azure location
  azure_location = ""
}