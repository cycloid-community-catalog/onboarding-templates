module "compute" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-compute"
  project  = var.project
  env      = var.env
  customer = var.customer
  #####################################


  #
  # vSphere
  #

  #. vsphere_datacenter (required,string): dc1
  #+ Datacenter where to create the virtual machine
  vsphere_datacenter = "Value injected by StackForms"

  #. vsphere_datastore (required,string): datastore1
  #+ Datastore where to create the virtual machine
  vsphere_datastore = "Value injected by StackForms"

  #. vsphere_cluster (required,string): cluster1
  #+ Cluster where to create the virtual machine
  vsphere_cluster = "Value injected by StackForms"

  #. vsphere_template (required,string): debian-9
  #+ Virtual machine template
  vsphere_template = "Value injected by StackForms"

  #. vsphere_network (required,string): VM Network
  #+ Cluster where to create the virtual machine
  vsphere_network = "Value injected by StackForms"


  #
  # VM
  #

  #. vm_name (required,string): ($ .project $)-($ .environment $)
  #+ Name of the virtual machine
  vm_name = "${var.project}-${var.env}"

  #. vm_ip (required,string): "212.129.18.92"
  #+ IP address of the virtual machine
  vm_ip = "Value injected by StackForms"

  #. vm_mac (required,string): "00:50:56:01:f1:96"
  #+ IP address of the virtual machine
  vm_mac = "Value injected by StackForms"

  #. vm_cpu (required,integer): 2
  #+ Number of CPU allocated to the virtual machine
  vm_cpu = "Value injected by StackForms"

  #. vm_memory (required,integer): 2048
  #+ Memory allocated to the virtual machine (Mo)
  vm_memory = "Value injected by StackForms"

  #. vm_disk_size (required,integer): 20
  #+ Disk size allocated to the virtual machine (Go)
  vm_disk_size = "Value injected by StackForms"
}