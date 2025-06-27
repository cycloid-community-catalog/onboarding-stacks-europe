# Cycloid variables
variable "cy_component" {}
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

# Azure variables
variable "azure_cred" {
  description = "Contains Azure subscription_id, tenant_id, client_id, and client_secret"
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

# MySQL Database variables
variable "server_name" {
  description = "Name of the MySQL Flexible Server."
  default     = ""
}

variable "mysql_version" {
  description = "Version of MySQL to use."
  default     = "8.0.21"
}

variable "administrator_login" {
  description = "Administrator login for MySQL server."
  default     = "mysqladmin"
}

variable "storage_mb" {
  description = "Storage size in MB."
  default     = 32768
}

variable "sku_name" {
  description = "SKU name for the MySQL Flexible Server."
  default     = "B_Standard_B1ms"
}

variable "backup_retention_days" {
  description = "Backup retention days."
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups."
  default     = false
}

variable "database_name" {
  description = "Name of the database to create."
  default     = ""
}

variable "res_selector" {
  description = "Whether to create a new Resource group or select existing ones."
  default     = "create"
}

variable "azure_location" {
  description = "Azure location."
  default     = "West Europe"
}

variable "resource_group_name_inventory" {
  description = "The name of the existing resource group where the resources will be deployed."
  default     = ""
}

variable "resource_group_name_manual" {
  description = "The name of the existing resource group where the resources will be deployed."
  default     = ""
} 