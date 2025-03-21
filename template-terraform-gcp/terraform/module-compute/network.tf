resource "google_compute_network" "compute" {
  name = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "compute" {
  name          = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  ip_cidr_range = "10.77.0.0/16"
  network       = google_compute_network.compute.id
}