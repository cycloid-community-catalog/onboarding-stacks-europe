#
# Resource Group outputs
#
output "resource_group_name" {
  value       = module.node.resource_group_name
}

#
# vNet outputs
#
output "vnet_name" {
  description = "The name for the virtual network"
  value       = module.node.vnet_name
}

output "subnet_id" {
  description = "The name for the subnet"
  value       = module.node.subnet_id
}

#
# Instance outputs
#
output "vm_name" {
  description = "The name the instance"
  value       = module.node.vm_name
}

output "vm_public_ip" {
  description = "The IP address the instance"
  value       = module.node.vm_public_ip
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = module.node.vm_os_user
}

output "vm_ssh" {
  description = "The SSH address to connect to the instance"
  value       = "${module.node.vm_os_user}@${module.node.vm_public_ip}"
}

output "url" {
  description = "The URL of the wepapp"
  value       = "http://${module.node.vm_public_ip}"
}
