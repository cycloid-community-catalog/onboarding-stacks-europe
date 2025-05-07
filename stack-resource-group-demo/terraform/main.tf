module "resource_group" {
  #####################################
  # Do not modify the following lines #
  source        = "./module-rg"
  cy_org        = var.cy_org
  cy_project    = var.cy_project
  cy_env        = var.cy_env
  cy_component  = var.cy_component
  #####################################

  # Resource group configuration
  resource_group_name = var.resource_group_name
  azure_location     = var.azure_location
  enable_custom_tags = var.enable_custom_tags
  custom_tags        = var.custom_tags
} 