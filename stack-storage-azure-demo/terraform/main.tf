module "storage" {
  #####################################
  # Do not modify the following lines #
  source        = "./module-storage"
  cy_org        = var.cy_org
  cy_project    = var.cy_project
  cy_env        = var.cy_env
  cy_component  = var.cy_component
  #####################################

  # Storage configuration
  storage_account_name      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  azure_location           = var.azure_location
  account_tier             = var.account_tier
  replication_type         = var.replication_type
  enable_https_traffic_only = var.enable_https_traffic_only
  create_containers        = var.create_containers
  containers               = var.containers
} 