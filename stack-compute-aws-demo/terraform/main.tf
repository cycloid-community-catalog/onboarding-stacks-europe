module "compute" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-compute"
  cy_org  = var.cy_org
  cy_pro  = var.cy_pro
  cy_env  = var.cy_env
  cy_com  = var.cy_com
  #####################################

  #. aws_region: ''
  #+ AWS region where to deploy the resoureces
  aws_region = var.aws_region

  #. vm_instance_type: 't3.micro'
  #+ Instance type for the VM
  vm_instance_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. vm_ports_in: ["80", "443"]
  #+ Ingress TCP ports allowed from the internet
  vm_ports_in = ["80", "443"]

  #. res_selector: ''
  #+ Whether to create a new VPC or select an existing one
  res_selector = "Value injected by StackForms"

  #. vpc_id_inventory: ''
  #+ VPC where to deploy the resources
  vpc_id_inventory = "Value injected by StackForms"

  #. vpc_id_manual: ''
  #+ VPC where to deploy the resources
  vpc_id_manual = "Value injected by StackForms"
}
