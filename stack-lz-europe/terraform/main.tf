module "lz" {
  #####################################
  # Do not modify the following lines #
  source = "./module-lz"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. outscale_region: []
  #+ The Outscale region where to deploy the infrastructure
  outscale_region = var.outscale_region

  #. ionos_regions: []
  #+ The IONOS region where to deploy the infrastructure
  ionos_region = var.ionos_region
}
