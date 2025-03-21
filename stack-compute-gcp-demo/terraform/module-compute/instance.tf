resource "google_compute_firewall" "compute" {
  name    = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
  network = local.compute_network_name

  allow {
    protocol = "tcp"
    ports    = var.vm_ports_in
  }

  source_ranges = ["0.0.0.0/0"]
}

data "google_compute_zones" "available" {
  status = "UP"
}

resource "google_compute_instance" "compute" {
  name           = "${var.cyorg}-${var.cypro}-${var.cyenv}-${var.cycom}"
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
    subnetwork = local.compute_subnetwork_name

    access_config {
      // Ephemeral public IP
      network_tier = "STANDARD"
    }
  }

  metadata = {
    sshKeys = "${var.vm_os_user}:${tls_private_key.ssh_key.public_key_openssh}"
  }

  labels = {
    cyorg = var.cyorg
    cypro = var.cypro
    cyenv = var.cyenv
    cycom = var.cycom
    role = "compute"
  }
}