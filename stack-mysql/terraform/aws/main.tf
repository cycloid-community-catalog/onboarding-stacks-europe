module "rds" {
  #####################################
  # Do not modify the following lines #
  source    = "./module-rds"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. aws_region: ''
  #+ AWS region where to deploy the resoureces
  aws_region = var.aws_region

  #. rds_engine_version: '8.0.35'
  #+ The MySQL engine version to use.
  rds_engine_version = "8.0.35"

  #. rds_instance_class: 'db.t4g.small'
  #+ The instance type of the RDS instance.
  rds_instance_class = "db.t4g.small"

  #. rds_allocated_storage: "20"
  #+ The amount of allocated storage.
  rds_allocated_storage = "20"

  #. database_name: ''
  #+ Name of the database to create.
  database_name = ""

  #. master_username: 'admin'
  #+ Master username for the database.
  master_username = ""
} 