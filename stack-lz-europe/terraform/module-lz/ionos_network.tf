resource "ionoscloud_datacenter" "datacenter" {
  name                = "Datacenter ${var.ionos_region}"
  location            = var.ionos_region
  sec_auth_protection = false
}

resource "ionoscloud_lan" "lans" {
  datacenter_id = ionoscloud_datacenter.datacenter.id
  name          = "${var.cy_org}-${var.cy_pro}-${var.cy_env}"
  public        = false
}