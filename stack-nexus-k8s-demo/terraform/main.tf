module "nexus" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-nexus"
  cyorg  = var.cyorg
  cypro  = var.cypro
  cyenv  = var.cyenv
  cycom  = var.cycom
  #####################################

  #. vm_disk_size: 20
  #+ Disk size for the Nexus Repository (Go)
  vm_disk_size = ""
}