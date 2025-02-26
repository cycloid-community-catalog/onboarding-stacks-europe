resource "cycloid_credential" "git-ssh" {
  name                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-nexus"
  description            = "SSH private key allowing access to a code git repository."
  organization_canonical = var.cy_org
  path                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-nexus"
  canonical              = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-nexus"

  type = "basic_auth"
  body = {
    username = "admin"
    password = "admin123"
  }
}