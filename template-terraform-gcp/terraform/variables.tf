# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# GCP variables
variable "gcp_project" {}
variable "gcp_region" {
  description = "GCP region where to create servers."
  default     = "europe-west1"
}
variable "gcp_zone" {
  description = "GCP zone where to create servers."
  default     = "europe-west1-b"
}