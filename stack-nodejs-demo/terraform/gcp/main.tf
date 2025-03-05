module "node" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-node"
  cyproject  = var.cyproject
  cyenv      = var.cyenv
  cyorg      = var.cyorg
  #####################################

  #. extra_tags (optional): {}
  #+ Dict of extra tags to add on resources. format { "foo" = "bar" }.
  extra_tags = {
    demo = true
    monitoring_discovery = false
  }

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = "Value injected by StackForms"

  #. vm_instance_type: 'n2-standard-2'
  #+ Machine type for the VM
  vm_machine_type = "Value injected by StackForms"

  #. vm_disk_size: 20
  #+ Disk size for the VM (Go)
  vm_disk_size = "Value injected by StackForms"

  #. vpc_name: ''
  #+ VPC name where to deploy the instance
  vpc_name = "Value injected by StackForms"

  #. gcp_zone: ''
  #+ GCP zone where to create servers
  gcp_zone = var.gcp_zone
}
