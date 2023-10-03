module "webapp" {
  #####################################
  # Do not modify the following lines #
  source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//aws/ec2-nodejs"
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

  #. vm_instance_type: 't3.micro'
  #+ Instance type for the VM
  vm_instance_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. subnet_id: ""
  #+ Subnet ID where to deploy the instance
  subnet_id = var.edit_subnet ? var.edit_subnet_id : var.inventory_subnet_id

  #. associate_public_ip_address: true
  #+ Whether to associate a public IP on the primary interface or not
  #associate_public_ip_address = false # Defaults to true in the module. Uncomment to override.
}
