output "ipv4" {
    value = ionoscloud_server.compute.primary_ip
}

output "username" {
    value = var.ionos_username
}