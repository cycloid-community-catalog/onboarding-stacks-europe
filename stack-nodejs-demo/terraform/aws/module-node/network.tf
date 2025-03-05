

data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  for_each = toset(var.subnet_ids)
  id       = each.value

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}