resource "aws_db_subnet_group" "rds" {
  name       = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  }
}