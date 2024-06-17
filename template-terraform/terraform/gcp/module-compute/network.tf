data "google_compute_network" "selected" {
  name = var.vpc_name
}

data "google_compute_subnetwork" "selected" {
  self_link = data.google_compute_network.selected.subnetworks_self_links[0]
}