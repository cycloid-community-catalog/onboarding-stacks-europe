resource "cycloid_credential" "rds" {
  name                   = "${var.cy_project}-${var.cy_env}-postgresql"
  description            = "Username and password to connect to the RDS database."
  organization_canonical = var.cy_org
  path                   = "${var.cy_project}-${var.cy_env}-postgresql"
  canonical              = "${var.cy_project}-${var.cy_env}-postgresql"

  type = "basic_auth"
  body = {
    username = aws_db_instance.db.username
    password = random_password.rds.result
  }
}