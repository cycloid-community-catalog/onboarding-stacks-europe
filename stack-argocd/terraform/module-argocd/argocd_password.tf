resource "random_password" "argocd" {
  length           = 16
  special          = false
}

resource "cycloid_credential" "ssh_key" {
  name                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-admin-argocd"
  description            = "ArgoCD Admin password."
  path                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-admin-argocd"
  canonical              = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-admin-argocd"

  type = "basic_auth"
  body = {
    username = "admin"
    password = random_password.argocd.result
  }
}