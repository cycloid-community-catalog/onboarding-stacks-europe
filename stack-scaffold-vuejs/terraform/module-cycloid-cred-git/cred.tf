resource "cycloid_credential" "git-ssh" {
  name                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-git-ssh"
  description            = "SSH private key allowing access to a code git repository."
  organization_canonical = var.cyorg
  path                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-git-ssh"
  canonical              = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-git-ssh"

  type = "ssh"
  body = {
    ssh_key = chomp(var.git_ssh_key)
  }
}