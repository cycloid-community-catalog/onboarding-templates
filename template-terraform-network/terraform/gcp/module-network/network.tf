resource "google_compute_network" "infra" {
  name = "${var.customer}-${var.project}-${var.env}-infra"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "infra" {
  name          = "${var.customer}-${var.project}-${var.env}-infra"
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.infra.id
}