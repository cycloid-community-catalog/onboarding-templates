module "network" {
  #####################################
  # Do not modify the following lines #
  source   = "git::https://github.com/cycloid-community-catalog/onboarding-iac.git//azure/network-rg"
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

  #. rg_name: ''
  #+ The name of the existing resource group where the resources will be deployed
  rg_name = "Value injected by StackForms"

  #. azure_location: "West Europe"
  #+ Azure location where to create Resource Group and Networking resources
  azure_location = "Value injected by StackForms"

  #. network_cidr: "10.0.0.0/16"
  #+ The CIDR of the Virtual Network
  network_cidr = "Value injected by StackForms"

  #. subnet_cidr: "10.0.0.0/24"
  #+ The CIDR for the Subnet
  subnet_cidr = "Value injected by StackForms"
}
