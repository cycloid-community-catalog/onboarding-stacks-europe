resource "google_compute_firewall" "compute" {
  name    = "${var.cyorg}-${var.cyproject}-${var.cyenv}"
  network = data.google_compute_network.selected.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# data "google_compute_zones" "available" {
#   status = "UP"
# }

resource "google_compute_instance" "compute" {
  name           = "${var.cyorg}-${var.cyproject}-${var.cyenv}"
  machine_type   = var.vm_machine_type
  can_ip_forward = false
  # zone           = data.google_compute_zones.available.names[length(data.google_compute_zones.available.names)-1]
  zone           = var.gcp_zone

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
    subnetwork = data.google_compute_subnetwork.selected.name

    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  metadata = {
    sshKeys = "${var.vm_os_user}:${tls_private_key.ssh_key.public_key_openssh}"
  }

  metadata_startup_script = templatefile(
    "${path.module}/userdata.sh",
    {
      git_app_url = var.git_app_url
    }
  )

  labels = merge(local.merged_tags, {
    role       = "compute"
  })
}