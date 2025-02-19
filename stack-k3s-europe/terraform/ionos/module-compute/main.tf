resource "ionoscloud_server" "compute" {
  name              = "${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  datacenter_id     = ionoscloud_datacenter.datacenter.id
  availability_zone = "AUTO"
  type              = "CUBE"
  template_uuid     = data.ionoscloud_template.compute.id
  image_name        = "debian:latest"
  ssh_keys          = [tls_private_key.ssh_key.public_key_openssh]

  volume {
    name         = "Volume Cycloid Demo"
    licence_type = "LINUX" 
    disk_type    = "DAS"
    user_data    = base64encode(local.cloud_init)
  }
  
  nic {
    lan             = ionoscloud_lan.public.id
    name            = "Nic Cycloid"
    dhcp            = true
    firewall_active = false
  }

  provisioner "file" {
    source      = "/etc/rancher/k3s/k3s.yaml"
    destination = "kubeconfig"

    connection {
      type        = "ssh"
      user        = "root"
      private_key = tls_private_key.ssh_key.private_key_openssh
      host        = ionoscloud_server.compute.primary_ip
    }
  }
}

locals {
  cloud_init = <<-EOT
    #cloud-config
    runcmd:
    - 'curl -sfL https://get.k3s.io | sudo sh -'
    EOT
}

resource "ionoscloud_datacenter" "datacenter" {
  name     = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  location = var.ionos_region
}

resource "ionoscloud_lan" "public" {
  datacenter_id = ionoscloud_datacenter.datacenter.id
  public        = true
}

data "ionoscloud_template" "compute" {
    name = var.ionos_cube
}