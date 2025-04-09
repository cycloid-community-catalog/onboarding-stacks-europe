data "aws_subnet" "selected" {
  id = var.rds_subnet_id
}

data "aws_vpc" "selected" {
  id = data.aws_subnet.selected.vpc_id
}