resource "github_repository" "argocd" {
  name        = "${var.cyorg}-${var.cypro}-argocd"
  description = "ArgoCD repo managed by Cycloid in ${var.cypro} project in ${var.cyorg} org"

  visibility = "private"
  auto_init  = true
}

resource "github_branch" "master" {
  repository = github_repository.argocd.name
  branch     = "master"
}

resource "github_branch_default" "master"{
  repository = github_repository.argocd.name
  branch     = github_branch.master.branch
}

resource "tls_private_key" "github_generated_key" {
  algorithm   = "ED25519"
}

resource "github_repository_deploy_key" "argocd" {
  title      = "${var.cypro}"
  repository = github_repository.argocd.name
  key        = tls_private_key.github_generated_key.public_key_openssh
  read_only  = false
}

resource "cycloid_credential" "ssh_key" {
  name                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-github-argocd"
  description            = "SSH Key Pair used to access ArgoCD GitHub repo."
  path                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-github-argocd"
  canonical              = "${var.cyorg}-${var.cypro}-${var.cyenv}-github-argocd"

  type = "ssh"
  body = {
    ssh_key = chomp(tls_private_key.github_generated_key.private_key_openssh)
  }
}