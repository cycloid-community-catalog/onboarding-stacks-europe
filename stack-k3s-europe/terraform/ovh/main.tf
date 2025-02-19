module "compute" {
  #####################################
  # Do not modify the following lines #
  source = "./module-compute"
  cy_org  = var.cy_org
  cy_pro  = var.cy_pro
  cy_env  = var.cy_env
  cy_com  = var.cy_com
  #####################################

  #. ovh_cred: ""
  #+ The OVH Openstack cred to use to deploy the infrastructure
  ovh_cred = var.ovh_cred

  #. ovh_region: ""
  #+ The OVH region where to deploy the infrastructure
  ovh_region = ""

  #. ovh_flavor_name: ""
  #+ The OVH regions where to deploy the infrastructure
  ovh_flavor_name = ""
}