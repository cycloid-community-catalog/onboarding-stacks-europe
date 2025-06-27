resource "cycloid_credential" "rds" {
  name                   = "${var.cy_project}-${var.cy_env}-${var.cy_component}"
  description            = "Username and password to connect to the RDS database."
  organization_canonical = var.cy_org
  path                   = "${var.cy_project}-${var.cy_env}-${var.cy_component}"
  canonical              = "${var.cy_project}-${var.cy_env}-${var.cy_component}"

  type = "basic_auth"
  body = {
    username = aws_db_instance.db.username
    password = random_password.rds.result
  }
}