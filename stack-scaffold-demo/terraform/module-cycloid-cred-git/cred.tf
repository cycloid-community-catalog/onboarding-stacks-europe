resource "cycloid_credential" "git-ssh" {
  name                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-git-ssh"
  description            = "SSH private key allowing access to a code git repository."
  organization_canonical = var.cyorg
  path                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-git-ssh"
  canonical              = "${var.cyorg}-${var.cypro}-${var.cyenv}-git-ssh"

  type = "ssh"
  body = {
    ssh_key = chomp(var.git_ssh_key)
  }
}