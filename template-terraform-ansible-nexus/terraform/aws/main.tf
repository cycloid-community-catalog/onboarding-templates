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

  #
  # Nexus Repository
  #

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

  #
  # Networking
  #

  #. create_network: true
  #+ Whether to create a VPC and subnets
  create_network = "Value injected by StackForms"

  #. subnet_id: ""
  #+ Public subnet ID where to deploy the EC2 instance. Must belong to the region stated below in this form
  subnet_id = "Value injected by StackForms"
}