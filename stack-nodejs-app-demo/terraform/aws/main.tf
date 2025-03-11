module "node" {
  #####################################
  # Do not modify the following lines #
  source     = "./module-node"
  cyenv     = var.cyenv
  cyproject = var.cyproject
  cyorg     = var.cyorg
  #####################################

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = "Value injected by StackForms"

  #. vm_instance_type: 't3.micro'
  #+ Instance type for the VM
  vm_instance_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. vpc_id: ''
  #+ VPC ID where to deploy the EC2 instances
  vpc_id = "Value injected by StackForms"

  #. subnet_ids: []
  #+ Subnet IDs where to deploy the EC2 instances
  subnet_ids = "Value injected by StackForms"
}
