resource "cycloid_credential" "git-ssh" {
  name                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-nexus"
  description            = "SSH private key allowing access to a code git repository."
  organization_canonical = var.cyorg
  path                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-nexus"
  canonical              = "${var.cyorg}-${var.cypro}-${var.cyenv}-nexus"

  type = "basic_auth"
  body = {
    username = "admin"
    password = "admin123"
  }
}