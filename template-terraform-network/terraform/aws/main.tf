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

  #. create_bastion: false
  #+ Deploy a bastion or not
  create_bastion = var.create_bastion

  #. keypair_public: ""
  #+ The public SSH key, for SSH access to newly-created instances
  keypair_public = var.keypair_public

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
