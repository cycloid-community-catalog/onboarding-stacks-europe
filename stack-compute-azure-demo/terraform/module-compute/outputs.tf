output "vm_public_ip" {
  description = "The IP address the EC2 instance"
  value       = azurerm_linux_virtual_machine.compute.public_ip_address
}

output "vm_os_user" {
  description = "Admin username to connect to instance via SSH"
  value       = var.vm_os_user
}