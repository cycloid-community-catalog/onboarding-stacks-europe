resource "github_repository" "scaffold" {
  name        = "${var.cy_org}-${var.cy_pro}"
  description = "Repo for ${var.cy_pro} project"

  visibility = "private"
  auto_init  = true
}

resource "github_branch" "develop" {
  repository = github_repository.scaffold.name
  branch     = "develop"
}

resource "github_branch_default" "develop"{
  repository = github_repository.scaffold.name
  branch     = github_branch.develop.branch
}

resource "tls_private_key" "github_generated_key" {
  algorithm   = "ED25519"
}

resource "github_repository_deploy_key" "scaffold" {
  title      = "${var.cy_pro}"
  repository = github_repository.scaffold.name
  key        = tls_private_key.github_generated_key.public_key_openssh
  read_only  = false
}