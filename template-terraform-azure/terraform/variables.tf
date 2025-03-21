# Cycloid variables
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

# Cloud variables
variable "azure_cred" {
  description = "The azure credential used to deploy the infrastructure. It contains subscription_id, tenant_id, client_id, and client_secret"
}
