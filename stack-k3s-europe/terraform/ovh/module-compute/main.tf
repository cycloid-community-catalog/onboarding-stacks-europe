resource "openstack_compute_instance_v2" "compute" {
  name            = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  region          = var.ovh_region
  image_id        = data.openstack_images_image_v2.debian.id
  flavor_name     = var.ovh_flavor_name
  key_pair        = openstack_compute_keypair_v2.cycloid_keypair.name
  security_groups = ["default"]
  user_data       = base64encode(local.cloud_init)

  network {
    name = "Ext-Net" # Public network interface name
  }

  lifecycle {
    # OVHcloud regularly updates the base image of a given OS so that customer has less packages to update after spawning a new instance 
    # To avoid terraform to have some issue with that, the following ignore_changes is required.
    ignore_changes = [
      image_name
    ]
  }
  provider = openstack.ovh
}

locals {
  cloud_init = <<-EOT
    #cloud-config
    runcmd:
    - 'curl -sfL https://get.k3s.io | sudo sh -'
    EOT
}

resource "openstack_compute_keypair_v2" "cycloid_keypair" {
  name       = "${var.cy_org}-${var.cy_pro}-${var.cy_env}"
  region     = var.ovh_region
  public_key = tls_private_key.ssh_key.public_key_openssh

  provider = openstack.ovh
}

data "openstack_images_image_v2" "debian" {
  name        = "Debian 12"
  region      = var.ovh_region
  most_recent = true

  provider = openstack.ovh
}