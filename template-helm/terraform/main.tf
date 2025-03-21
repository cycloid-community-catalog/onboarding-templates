module "nexus" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-nexus"
  cy_org  = var.cy_org
  cy_pro  = var.cy_pro
  cy_env  = var.cy_env
  cy_com  = var.cy_com
  #####################################

  #. vm_disk_size: 20
  #+ Disk size for the Nexus Repository (Go)
  vm_disk_size = "Value injected by StackForms"

  #. nexus_port: 8081
  #+ Port where Nexus Repository service is exposed
  nexus_port = "Value injected by StackForms"
}