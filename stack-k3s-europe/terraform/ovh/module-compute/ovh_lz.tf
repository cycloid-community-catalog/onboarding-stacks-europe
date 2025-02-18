data "ovh_cloud_project_network_private" "networks" {
  for_each = var.ovh_network_ids

  service_name = var.ovh_project_id
  network_id   = var.ovh_network_ids[each.key]
}