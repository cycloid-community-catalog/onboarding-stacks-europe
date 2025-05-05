resource "random_password" "postgresql" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "cycloid_credential" "ssh_key" {
  name                   = "${var.cy_project}-${var.cy_env}-database"
  description            = "SSH Key Pair used in newly provisionned workloads."
  path                   = "${var.cy_project}-${var.cy_env}-database"
  canonical              = "${var.cy_project}-${var.cy_env}-database"

  type = "basic_auth"
  body = {
    username = var.administrator_login
    password = random_password.postgresql.result
  }
}