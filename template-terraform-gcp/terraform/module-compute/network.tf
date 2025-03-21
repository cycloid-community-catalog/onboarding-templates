resource "google_compute_network" "compute" {
  name = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "compute" {
  name          = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  ip_cidr_range = "10.77.0.0/16"
  network       = google_compute_network.compute.id
}