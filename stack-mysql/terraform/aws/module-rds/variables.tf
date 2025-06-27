# Cycloid
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

variable "aws_region" {
  description = "AWS region where to deploy the resources."
}

variable "rds_engine_version" {
  description = "The MySQL engine version to use."
  default = "8.0.35"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance."
  default = "db.t4g.small"
}

variable "rds_allocated_storage" {
  description = "The amount of allocated storage."
}

variable "database_name" {
  description = "Name of the database to create."
  default = ""
}

variable "master_username" {
  description = "Master username for the database."
  default = "admin"
}

variable "res_selector" {
  description = "Whether to create a new VPC and Subnet or select an existing Subnet."
}

variable "rds_subnet_ids_inventory" {
  description = "Subnets where to deploy the RDS instance."
  type = list(string)
  default = []
} 