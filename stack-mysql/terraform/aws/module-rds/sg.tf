resource "aws_security_group" "rds" {
  name        = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  description = "${var.cy_project} ${var.cy_env} ${var.cy_component}"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "postgresql" {
  security_group_id = aws_security_group.rds.id
  cidr_ipv4         = module.vpc.vpc_cidr_block
  from_port         = 5432
  to_port           = 5432
  ip_protocol       = "tcp"

  # referenced_security_group_id = aws_security_group.app_selected.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.rds.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# data "aws_security_group" "app_selected" {
#   id = var.app_security_group_id
# }