# Create node VM
resource "azurerm_linux_virtual_machine" "node" {
  name                  = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  computer_name         = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  resource_group_name   = data.azurerm_resource_group.node.name
  location              = data.azurerm_resource_group.node.location
  network_interface_ids = [azurerm_network_interface.node.id]
  size                  = var.vm_instance_type
  admin_username        = var.vm_os_user

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.vm_disk_size
  }

  source_image_reference {
      publisher = "Debian"
      offer     = "debian-12"
      sku       = "12"
      version   = "latest"
  }

  disable_password_authentication = true

  admin_ssh_key {
      username   = var.vm_os_user
      public_key = tls_private_key.ssh_key.public_key_openssh
  }
  
  custom_data = base64encode(templatefile(
    "${path.module}/userdata.sh",
    {
      git_app_url = var.git_app_url
    }
  ))

  tags = merge(local.merged_tags, {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
    role = "node"
  })
}