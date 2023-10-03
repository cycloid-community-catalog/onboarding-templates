module "webapp" {
  #####################################
  # Do not modify the following lines #
  source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//gcp/vm-nodejs"
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
  # Web App
  #

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = "Value injected by StackForms"

  #
  # Instance
  #

  #. vm_instance_type: 'n2-standard-2'
  #+ Machine type for the VM
  vm_machine_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. network_name: ""
  #+ Network name where to deploy the instance
  network_name = var.edit_network ? var.edit_network_name : var.inventory_network_name

}
