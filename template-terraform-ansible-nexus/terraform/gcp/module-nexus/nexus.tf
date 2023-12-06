resource "google_compute_firewall" "nexus" {
  name    = "${var.customer}-${var.project}-${var.env}-firewall-nexus"
  network = google_compute_network.nexus.name

  allow {
    protocol = "tcp"
    ports    = ["22", var.nexus_port]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "nexus" {
  name           = "${var.customer}-${var.project}-${var.env}-nexus"
  machine_type   = var.vm_machine_type
  can_ip_forward = false

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = var.vm_disk_size
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.nexus.name

    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  labels = merge(local.merged_tags, {
    role       = "nexus"
  })

  metadata = {
    sshKeys = "${var.vm_os_user}:${var.key_pair_public}"
  }
}