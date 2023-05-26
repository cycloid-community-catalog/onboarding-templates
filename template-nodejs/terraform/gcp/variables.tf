# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# GCP variables
variable "gcp_project" {}
variable "gcp_zone" {
  description = "GCP zone where to create the infrastructure."
  default     = "europe-west1-b"
}