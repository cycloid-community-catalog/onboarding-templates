resource "google_compute_firewall" "compute" {
  name    = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  network = google_compute_network.compute.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

data "google_compute_zones" "available" {
  status = "UP"
}

resource "google_compute_instance" "compute" {
  name           = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  machine_type   = var.vm_machine_type
  can_ip_forward = false
  zone           = data.google_compute_zones.available.names[length(data.google_compute_zones.available.names)-1]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = var.vm_disk_size
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.compute.name

    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  labels = {
    cy_org = var.cy_org
    cy_pro = var.cy_pro
    cy_env = var.cy_env
    cy_com = var.cy_com
    role = "compute"
  }
}