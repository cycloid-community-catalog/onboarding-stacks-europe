# Create random password
resource "random_password" "db" {
  length           = 16
  special          = false
}

resource "cycloid_credential" "db" {
  name                   = "${var.cy_project}-${var.cy_env}-mysql"
  description            = "Username and password to connect to the MySQL database."
  organization_canonical = var.cy_org
  path                   = "${var.cy_project}-${var.cy_env}-mysql"
  canonical              = "${var.cy_project}-${var.cy_env}-mysql"

  type = "basic_auth"
  body = {
    username = aws_db_instance.db.username
    password = random_password.db.result
  }
}