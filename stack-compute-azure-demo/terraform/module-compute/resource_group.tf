data "azurerm_resource_group" "compute" {
  count = var.res_selector == "create" ? 0 : 1

  name = var.res_selector == "inventory" ? var.vpc_name_inventory : var.vpc_name_manual
}

resource "azurerm_resource_group" "compute" {
  count = var.res_selector == "create" ? 1 : 0

  name     = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  location = var.azure_location
}

locals {
  resource_group_name = var.res_selector == "create" ? azurerm_resource_group.compute[0].name : data.azurerm_resource_group.compute[0].name
}