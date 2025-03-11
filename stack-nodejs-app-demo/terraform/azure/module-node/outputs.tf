#
# Resource Group outputs
#
output "resource_group_name" {
  description = "The name for the Resource Group"
  value       = data.azurerm_resource_group.node.name
}

#
# vNet outputs
#
output "vnet_name" {
  description = "The name for the virtual network"
  value       = data.azurerm_virtual_network.selected.name
}

output "subnet_id" {
  description = "The id for the subnet"
  value       = data.azurerm_subnet.selected.id
}

#
# Instance outputs
#
output "vm_name" {
  description = "The name the instance"
  value       = azurerm_linux_virtual_machine.node.name
}

output "vm_public_ip" {
  description = "The IP address the instance"
  value       = azurerm_linux_virtual_machine.node.public_ip_address
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = var.vm_os_user
}