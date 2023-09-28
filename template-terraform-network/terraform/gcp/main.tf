module "webapp" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-network"
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

  #. subnet_cidr: "10.0.0.0/24"
  #+ The CIDR for the Subnet
  subnet_cidr = "Value injected by StackForms"
}
