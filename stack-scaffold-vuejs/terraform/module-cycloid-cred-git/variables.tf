# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

variable "git_ssh_key" {
  description = "SSH private key allowing access to a code git repository."
  sensitive = true
}