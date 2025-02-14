# Creating a private network across regions
resource "ovh_cloud_project_network_private" "private_network" {
  service_name  = var.ovh_project_id
  name          = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}" # Network name
  regions       = var.ovh_regions
}

# Creating a private subnet for each region
resource "ovh_cloud_project_network_private_subnet" "private_subnets" {
  for_each      = var.ovh_regions

  network_id    = ovh_cloud_project_network_private.private_network.id
  service_name  = var.ovh_project_id
  region        = var.ovh_regions[each.key]
  network       = "192.168.${each.key}.0/24" # Subnet IP
  start         = "192.168.${each.key}.2" # First IP of the subnet
  end           = "192.168.${each.key}.200" # Last IP of the subnet
  dhcp          = true # Disabling DHCP
  no_gateway    = true # No default gateway
}