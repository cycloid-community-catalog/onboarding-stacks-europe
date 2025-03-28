data "azurerm_resource_group" "selected" {
  count = var.res_selector == "create" ? 0 : 1

  name = var.res_selector == "inventory" ? var.vpc_name_inventory : var.vpc_name_manual
}

resource "azurerm_resource_group" "compute" {
  count = var.res_selector == "create" ? 1 : 0

  name     = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  location = var.azure_location
}

locals {
  resource_group_name = var.res_selector == "create" ? azurerm_resource_group.compute[0].name : data.azurerm_resource_group.selected[0].name
  resource_group_location = var.res_selector == "create" ? azurerm_resource_group.compute[0].location : data.azurerm_resource_group.selected[0].location
}