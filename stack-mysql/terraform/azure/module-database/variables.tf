# Cycloid
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

variable "server_name" {
  description = "Name of the MySQL Flexible Server"
  type        = string
}

variable "mysql_version" {
  description = "MySQL version"
  type        = string
  default     = "8.0.21"
}

variable "administrator_login" {
  description = "Administrator login for MySQL server"
  type        = string
  default     = "mysqladmin"
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 32768
}

variable "sku_name" {
  description = "SKU name for the MySQL Flexible Server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "backup_retention_days" {
  description = "Backup retention days"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
  default     = "mydatabase"
}

variable "res_selector" {
  description = "Whether to create a new Resource group or select existing ones"
}

variable "azure_location" {
  description = "Azure location"
}

variable "resource_group_name_inventory" {
  description = "The name of the existing resource group where the resources will be deployed"
}

variable "resource_group_name_manual" {
  description = "The name of the existing resource group where the resources will be deployed"
}