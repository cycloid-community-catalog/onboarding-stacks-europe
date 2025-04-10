resource "aws_db_subnet_group" "rds" {
  name       = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  subnet_ids = [var.res_selector == "create" ? module.vpc[0].private_subnets[0] : data.aws_subnet.selected[0].id
]

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  }
}