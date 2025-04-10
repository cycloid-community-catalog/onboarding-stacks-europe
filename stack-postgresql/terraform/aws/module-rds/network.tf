# data "aws_subnet" "selected" {
#   count = var.res_selector == "create" ? 0 : 1

#   id = var.res_selector == "inventory" ? var.rds_subnet_ids_inventory : var.rds_subnet_ids_manual
# }

data "aws_vpc" "selected" {
  count = var.res_selector == "create" ? 0 : 1

  id = var.rds_subnet_ids_inventory[0]
}

module "vpc" {
  count = var.res_selector == "create" ? 1 : 0

  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.19.0"

  name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  
  azs                 = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  cidr                = "10.77.0.0/16"
  private_subnets     = ["10.77.1.0/24", "10.77.2.0/24", "10.77.3.0/24"]
  public_subnets      = ["10.77.101.0/24", "10.77.102.0/24", "10.77.103.0/24"]

  enable_nat_gateway      = false
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true
}