module "node" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-node"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = ""

  #. vm_cpu (required,integer): 2
  #+ Number of CPU allocated to the virtual machine
  vm_cpu = ""

  #. vm_memory (required,integer): 2048
  #+ Memory allocated to the virtual machine (Mo)
  vm_memory = ""

  #. vm_disk_size (required,integer): 20
  #+ Disk size allocated to the virtual machine (Go)
  vm_disk_size = ""

  #. vsphere_template (required,string): debian
  #+ Virtual machine template
  vsphere_template = ""
}
