module "database" {
  #####################################
  # Do not modify the following lines #
  source       = "./module-database"
  cy_org       = var.cy_org
  cy_project   = var.cy_project
  cy_env       = var.cy_env
  cy_component = var.cy_component
  #####################################

  #. server_name: ''
  #+ Name of the MySQL Flexible Server
  server_name = ""

  #. mysql_version: '8.0.21'
  #+ Version of MySQL to use
  mysql_version = "8.0.35"

  #. administrator_login: 'mysqladmin'
  #+ Administrator login for MySQL server
  administrator_login = ""

  #. sku_name: 'B_Standard_B1ms'
  #+ SKU name for the MySQL Flexible Server
  sku_name = ""

  #. backup_retention_days: 7
  #+ Backup retention days
  backup_retention_days = ""

  #. geo_redundant_backup_enabled: ''
  #+ Enable geo-redundant backups
  geo_redundant_backup_enabled = ""

  #. database_name: ''
  #+ Name of the database to create
  database_name = ""

  #. res_selector: ''
  #+ Whether to create a new Resource group or select existing ones
  res_selector = ""

  #. azure_location: ""
  #+ Azure location
  azure_location = ""

  #. resource_group_name_inventory: ''
  #+ The name of the existing resource group where the resources will be deployed
  resource_group_name_inventory = ""

  #. resource_group_name_manual: ''
  #+ The name of the existing resource group where the resources will be deployed
  resource_group_name_manual = ""
} 