module "compute" {
  #####################################
  # Do not modify the following lines #
  source = "./module-compute"
  cy_org  = var.cy_org
  cy_pro  = var.cy_pro
  cy_env  = var.cy_env
  cy_com  = var.cy_com
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #. ovh_project_id: []
  #+ The OVH Openstack project ID where to deploy the infrastructure
  ovh_project_id = var.ovh_cred.project_id

  #. ovh_regions: []
  #+ The OVH regions where to deploy the infrastructure
  ovh_regions = []

  #. ionos_regions: []
  #+ The IONOS regions where to deploy the infrastructure
  ionos_regions = []
}
