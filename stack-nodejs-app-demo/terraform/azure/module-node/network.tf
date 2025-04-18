data "azurerm_virtual_network" "selected" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.node.name
}

data "azurerm_subnet" "selected" {
  name                 = data.azurerm_virtual_network.selected.subnets[0]
  virtual_network_name = data.azurerm_virtual_network.selected.name
  resource_group_name  = data.azurerm_resource_group.node.name
}

# Create Network Security Group
resource "azurerm_network_security_group" "node" {
  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  resource_group_name = data.azurerm_resource_group.node.name
  location            = data.azurerm_resource_group.node.location

  security_rule {
    name                       = "inbound-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "inbound-http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = merge(local.merged_tags, {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  })
}

# Get a Static Public IP
resource "azurerm_public_ip" "node" {
  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  resource_group_name = data.azurerm_resource_group.node.name
  location            = data.azurerm_resource_group.node.location
  allocation_method   = "Static"

  tags = merge(local.merged_tags, {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  })
}

# Create Network Card for the VM
resource "azurerm_network_interface" "node" {
  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  resource_group_name = data.azurerm_resource_group.node.name
  location            = data.azurerm_resource_group.node.location

  ip_configuration {
      name                          = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
      subnet_id                     = data.azurerm_subnet.selected.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.node.id
  }

  tags = merge(local.merged_tags, {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  })
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "node" {
    network_interface_id      = azurerm_network_interface.node.id
    network_security_group_id = azurerm_network_security_group.node.id
}