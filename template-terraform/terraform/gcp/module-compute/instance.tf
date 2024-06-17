resource "google_compute_firewall" "compute" {
  name    = "${var.customer}-${var.project}-${var.env}"
  network = data.google_compute_network.selected.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

data "google_compute_zones" "available" {
  status = "UP"
}

resource "google_compute_instance" "compute" {
  name           = "${var.customer}-${var.project}-${var.env}"
  machine_type   = var.vm_machine_type
  can_ip_forward = false
  zone           = data.google_compute_zones.available.names[length(data.google_compute_zones.available.names)-1]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = var.vm_disk_size
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.selected.name

    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  labels = merge(local.merged_tags, {
    role       = "compute"
  })
}