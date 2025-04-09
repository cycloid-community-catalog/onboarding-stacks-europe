# Cycloid
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

variable "rds_engine_version" {
  description = "The engine version to use."
  default = "8.0"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance."
  default = "db.t4g.micro"
}

variable "rds_snapshot_identifier" {
  description = "Create this database from a snapshot. This corresponds to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  default = ""
}

variable "rds_subnet_id" {
  description = "Subnets where to deploy the RDS instance."
}

variable "app_security_group_id" {
  description = "The application security group to grant access to the database."
}
