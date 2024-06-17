module "compute" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-compute"
  project  = var.project
  env      = var.env
  customer = var.customer
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #
  # Instance
  #

  #. vm_instance_type: 'n2-standard-2'
  #+ Machine type for the VM
  vm_machine_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. vpc_name: ''
  #+ VPC name where to deploy the instance
  vpc_name = "Value injected by StackForms"

}
