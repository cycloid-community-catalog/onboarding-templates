# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# GCP variables
variable "gcp_project" {}
variable "gcp_region" {
  description = "GCP region where to create the infrastructure."
  default     = "europe-west1"
}
variable "gcp_zone" {
  description = "GCP zone where to create the infrastructure."
  default     = "europe-west1-b"
}

# Networking
variable "edit_network" {
  description = "Whether to use the Cycloid Asset Inventory to select a Network, or to enter it manually. To populate your Network in Cycloid Inventory, you may want to use the Networking stack template."
  default     = false
}
variable "inventory_network_name" {
  description = "Network Name where to deploy the instance. Must belong to the region stated in this form."
  default     = ""
}
variable "edit_network_name" {
  description = "Network Name where to deploy the instance. Must belong to the region stated in this form."
  default     = ""
}