module "nexus" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-nexus"
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

  #. keypair_public: ""
  #+ The public SSH key, for SSH access to newly-created instances
  keypair_public = var.keypair_public

  #. azure_location: "West Europe"
  #+ Azure location
  azure_location = "Value injected by StackForms"

  #. rg_name: 'cycloid-get-started'
  #+ The name of the existing resource group where the resources will be deployed
  rg_name = "Value injected by StackForms"

  #. vm_instance_type: 't3.micro'
  #+ Instance type for the Nexus Repository
  vm_instance_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the Nexus Repository (Go)
  vm_disk_size = "Value injected by StackForms"

  #. nexus_port: 8081
  #+ Port where Nexus Repository service is exposed
  nexus_port = "Value injected by StackForms"

  #. nexus_admin_password: changeme
  #+ Initial admin password in case of first installation
  nexus_admin_password = "Value injected by StackForms"
}