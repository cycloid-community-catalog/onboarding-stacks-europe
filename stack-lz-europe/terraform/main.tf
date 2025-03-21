module "lz" {
  #####################################
  # Do not modify the following lines #
  source = "./module-lz"
  cyorg  = var.cyorg
  cypro  = var.cypro
  cyenv  = var.cyenv
  cycom  = var.cycom
  #####################################

  #. outscale_region: []
  #+ The Outscale region where to deploy the infrastructure
  outscale_region = var.outscale_region

  #. ionos_regions: []
  #+ The IONOS region where to deploy the infrastructure
  ionos_region = var.ionos_region
}
