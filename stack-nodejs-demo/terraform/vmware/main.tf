module "node" {
  #####################################
  # Do not modify the following lines #
  source   = "./module-node"
  cyproject  = var.cyproject
  cyenv      = var.cyenv
  cyorg      = var.cyorg
  #####################################

  #. git_app_url: ''
  #+ Public git URL of the web application to build and deploy
  git_app_url = "Value injected by StackForms"

  #. vm_cpu (required,integer): 2
  #+ Number of CPU allocated to the virtual machine
  vm_cpu = "Value injected by StackForms"

  #. vm_memory (required,integer): 2048
  #+ Memory allocated to the virtual machine (Mo)
  vm_memory = "Value injected by StackForms"

  #. vm_disk_size (required,integer): 20
  #+ Disk size allocated to the virtual machine (Go)
  vm_disk_size = "Value injected by StackForms"

  #. vsphere_template (required,string): debian
  #+ Virtual machine template
  vsphere_template = "Value injected by StackForms"
}
