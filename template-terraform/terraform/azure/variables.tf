# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# Cloud variables
variable "azure_cred" {
  description = "The azure credential used to deploy the infrastructure. It contains subscription_id, tenant_id, client_id, and client_secret"
}

# Networking
variable "edit_subnet" {
  description = "Whether to use the Cycloid Asset Inventory to select a Subnet ID, or to enter it manually. To populate your subnet in Cycloid Inventory, you may want to use the Networking stack template."
  default     = false
}
variable "inventory_subnet_id" {
  description = "Subnet ID where to deploy the instance. Must belong to the region stated in this form."
  default     = ""
}
variable "edit_subnet_id" {
  description = "Subnet ID where to deploy the instance. Must belong to the region stated in this form."
  default     = ""
}