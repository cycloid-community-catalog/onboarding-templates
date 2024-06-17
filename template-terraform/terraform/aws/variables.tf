# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# AWS variables
variable "aws_cred" {
  description = "Contains AWS access_key and secret_key"
}
variable "aws_region" {
  description = "AWS region where to create servers."
  default     = "eu-west-1"
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