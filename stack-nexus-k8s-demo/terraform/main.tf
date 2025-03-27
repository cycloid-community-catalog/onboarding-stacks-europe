module "nexus" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-nexus"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. vm_disk_size: 20
  #+ Disk size for the Nexus Repository (Go)
  vm_disk_size = ""
}