# Cycloid variables
variable "cy_component" {}
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

# AWS variables
variable "aws_cred" {
  description = "Contains AWS access_key and secret_key"
}

variable "aws_region" {
  description = "AWS region where to create servers."
  default     = "eu-west-1"
}

variable "cy_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cy_api_key" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}

# MySQL RDS variables
variable "rds_engine_version" {
  description = "The MySQL engine version to use."
  default     = "8.0.35"
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance."
  default     = "db.t4g.small"
}

variable "rds_allocated_storage" {
  description = "The amount of allocated storage."
  default     = 20
}

variable "database_name" {
  description = "Name of the database to create."
  default     = ""
}

variable "master_username" {
  description = "Master username for the database."
  default     = "admin"
}

variable "res_selector" {
  description = "Whether to create a new VPC and Subnet or select an existing Subnet"
  default     = "create"
}

variable "rds_subnet_ids_inventory" {
  description = "Subnets where to deploy the resources"
  type        = list(string)
  default     = []
} 