# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# GCP variables
variable "gcp_project" {}
variable "gcp_region" {
  description = "GCP region where to create servers."
  default     = "europe-west1"
}
variable "gcp_zone" {
  description = "GCP zone where to create servers."
  default     = "b"
}