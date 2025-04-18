module "node" {
  #####################################
  # Do not modify the following lines #
  source     = "./module-node"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = ""

  #. vm_instance_type: 't3.micro'
  #+ Instance type for the VM
  vm_instance_type = ""

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = ""

  #. vpc_id: ''
  #+ VPC ID where to deploy the EC2 instances
  vpc_id = ""

  #. subnet_ids: []
  #+ Subnet IDs where to deploy the EC2 instances
  subnet_ids = ""
}
