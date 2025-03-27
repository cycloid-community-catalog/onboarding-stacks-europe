module "compute" {
  #####################################
  # Do not modify the following lines #
  source = "./module-compute"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  # The Outscale CPU Generation to deploy
  outscale_cpu_gen = "6"

  #. outscale_region: ""
  #+ The Outscale region where to deploy the infrastructure
  outscale_region = ""

  #. outscale_cpu: ""
  #+ The number of CPU to deploy
  outscale_cpu = ""

  #. outscale_mem: ""
  #+ The amount of memory to deploy
  outscale_mem = ""

  #. outscale_net: ""
  #+ The network where to deploy the infrastructure.
  outscale_net = ""

  #. outscale_private_network: ""
  #+ Whether to connect to an Outscale private network.
  outscale_private_network = ""
}