resource "github_repository" "scaffold" {
  name        = "${var.cy_project}-${var.cy_env}"
  description = "Repo for ${var.cy_project}-${var.cy_env} project"

  visibility = "private"
  auto_init  = true
}

resource "github_branch" "develop" {
  repository = github_repository.scaffold.name
  branch     = "develop"
}

resource "tls_private_key" "github_generated_key" {
  algorithm   = "ED25519"
}

resource "github_repository_deploy_key" "scaffold" {
  title      = "${var.cy_project}-${var.cy_env}"
  repository = github_repository.scaffold.name
  key        = tls_private_key.github_generated_key.public_key_openssh
  read_only  = false
}