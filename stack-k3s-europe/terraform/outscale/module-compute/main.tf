resource "outscale_vm" "compute" {
    image_id                 = data.outscale_images.debian[0].id
    vm_type                  = "tinav${var.outscale_cpu_gen}.c${var.outscale_cpu}r${var.outscale_mem}p1"
    keypair_name             = outscale_keypair.cycloid_keypair.keypair_name
    security_group_ids       = [outscale_security_group.security_group01.security_group_id]
    placement_subregion_name = var.outscale_region
    placement_tenancy        = "default"
    user_data                = base64encode(local.cloud_init)
    tags {
        key   = "name"
        value = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
    }
}

resource "outscale_security_group" "security_group01" {
  description         = "vm security group"
  security_group_name = "vm_security_group1"
}

locals {
  cloud_init = <<-EOT
    #cloud-config
    runcmd:
    - 'curl -sfL https://get.k3s.io | sudo sh -'
    EOT
}

data "outscale_images" "debian" {
    filter {
        name   = "account_aliases"
        values = ["Outscale"]
    }
    filter {
        name   = "image_ids"
        values = ["Debian-12*"]
    }
}
