resource "ionoscloud_datacenter" "datacenters" {
  for_each      = var.ionos_regions

  name                = "Datacenter ${var.ionos_regions[each.key]}"
  location            = var.ionos_regions[each.key]
  sec_auth_protection = false
}

resource "ionoscloud_lan" "lans" {
  for_each      = ionoscloud_datacenter.datacenters

  datacenter_id = ionoscloud_datacenter.datacenters[each.key].id
  name          = "${var.cy_org}-${var.cy_pro}-${var.cy_env}"
  public        = false
  pcc           = ionoscloud_private_crossconnect.crossconnect.id
}

resource "ionoscloud_private_crossconnect" "crossconnect" {
  name                  = "Cycloid Demo"
  description           = "Cycloid Demo"
}