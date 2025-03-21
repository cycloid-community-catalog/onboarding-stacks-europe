# Cycloid variables
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

variable "git_ssh_key" {
  description = "SSH private key allowing access to a code git repository."
  sensitive = true
}