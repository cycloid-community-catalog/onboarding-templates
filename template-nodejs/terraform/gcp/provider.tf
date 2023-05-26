provider "google" {
  project = var.gcp_project
  region  = substr(var.gcp_zone, 0, length(var.gcp_zone)-3)
  zone    = var.gcp_zone
}