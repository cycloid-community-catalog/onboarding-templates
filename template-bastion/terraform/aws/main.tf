module "vpc" {
  #####################################
  # Do not modify the following lines #
  source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//aws/vpc"
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
  # Bastion
  #

  #. keypair_public: ""
  #+ The public SSH key, for SSH access to newly-created instances
  keypair_public = var.keypair_public

  #. subnet_id: ''
  #+ Subnet ID where to deploy the EC2 instance
  subnet_id = var.subnet_id

  #
  # Network
  #

  #. vpc_cidr: "10.0.0.0/16"
  #+ Public Subnet CIDR
  vpc_cidr = "Value injected by StackForms"

  #. vpc_public_subnet: "10.0.0.0/24"
  #+ Public Subnet CIDR
  vpc_public_subnet = "Value injected by StackForms"

  #. vpc_private_subnet: "10.0.1.0/24"
  #+ Private Subnet CIDR
  vpc_private_subnet = "Value injected by StackForms"

}
