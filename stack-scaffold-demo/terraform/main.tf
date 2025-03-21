module "cycloid-cred-git" {
  #####################################
  # Do not modify the following lines #
  source    = "./module-cycloid-cred-git"
  cyorg  = var.cyorg
  cypro  = var.cypro
  cyenv  = var.cyenv
  cycom  = var.cycom
  #####################################

  #. git_ssh_key: ''
  #+ Git repository SSH private key for stacks and config
  git_ssh_key = tls_private_key.github_generated_key.private_key_openssh

  depends_on = [ github_repository.scaffold ]
}