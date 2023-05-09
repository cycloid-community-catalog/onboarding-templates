# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# Cloud variables
variable "azure_cred" {
  description = "The azure credential used to deploy the infrastructure. It contains subscription_id, tenant_id, client_id, and client_secret"
}