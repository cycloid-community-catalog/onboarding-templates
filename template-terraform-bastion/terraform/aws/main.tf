module "bastion" {
  #####################################
  # Do not modify the following lines #
  # source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//aws/bastion"
  source   = "./module-bastion"
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

}
