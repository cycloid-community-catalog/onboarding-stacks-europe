output "ipv4" {
    value = outscale_vm.compute.public_ip
}

output "dns_name" {
    value = outscale_vm.compute.public_dns_name
}