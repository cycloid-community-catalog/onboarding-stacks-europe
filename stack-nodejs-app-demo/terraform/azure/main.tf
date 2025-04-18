module "node" {
  #####################################
  # Do not modify the following lines #
  source    = "./module-node"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = ""

  #. resource_group_name: 'cycloid-demo'
  #+ The name of the existing resource group where the resources will be deployed
  resource_group_name = ""

  #. azure_location: "West Europe"
  #+ Azure location
  azure_location = ""

  #. vm_instance_type: 'Standard_DS2_v2'
  #+ Instance type for the VM
  vm_instance_type = ""

  #. vm_disk_size: 30
  #+ Disk size for the VM (Go)
  vm_disk_size = ""
}