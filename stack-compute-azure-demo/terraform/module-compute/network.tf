data "azurerm_virtual_network" "selected" {
  count = var.res_selector == "create" ? 0 : 1

  name                = var.res_selector == "inventory" ? var.vpc_name_inventory : var.vpc_name_manual
  resource_group_name = local.resource_group_name
}

data "azurerm_subnet" "selected" {
  count = var.res_selector == "create" ? 0 : 1

  name                 = data.azurerm_virtual_network.selected[0].subnets[0]
  virtual_network_name = data.azurerm_virtual_network.selected[0].name
  resource_group_name  = local.resource_group_name
}

resource "azurerm_virtual_network" "compute" {
  count = var.res_selector == "create" ? 1 : 0

  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  address_space       = ["10.77.0.0/16"]
}

resource "azurerm_subnet" "compute" {
  count = var.res_selector == "create" ? 1 : 0

  name                 = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.compute[0].name
  address_prefixes     = ["10.77.1.0/24"]
}

resource "azurerm_network_security_group" "compute" {
  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
    role = "security_group"
  }
}

resource "azurerm_network_security_rule" "inbound" {
  for_each          = toset([for v in var.vm_ports_in : tostring(v)])

  resource_group_name         = local.resource_group_name
  network_security_group_name = azurerm_network_security_group.compute.name

  name                       = "inbound-${each.value}"
  priority                   = 100 + index(var.vm_ports_in, each.value)
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "${each.value}"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

# Get a Static Public IP
resource "azurerm_public_ip" "compute" {
  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  allocation_method   = "Dynamic"

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
    role = "public_ip"
  }
}

# Create Network Card for the VM
resource "azurerm_network_interface" "compute" {
  name                = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location

  ip_configuration {
      name                          = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
      subnet_id                     = var.res_selector == "create" ? azurerm_subnet.compute[0].id : data.azurerm_subnet.selected[0].id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.compute.id
  }

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
    role = "network_interface"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "compute" {
    network_interface_id      = azurerm_network_interface.compute.id
    network_security_group_id = azurerm_network_security_group.compute.id
}