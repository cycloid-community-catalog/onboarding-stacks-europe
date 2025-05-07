# Cycloid variables
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account to create"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the storage account will be created"
}

variable "azure_location" {
  type        = string
  description = "Azure region where the storage account will be created"
  default     = "westeurope"
}

variable "account_tier" {
  type        = string
  description = "The tier of the storage account"
  default     = "Standard"
}

variable "replication_type" {
  type        = string
  description = "The replication type for the storage account"
  default     = "LRS"
}

variable "enable_https_traffic_only" {
  type        = bool
  description = "Forces HTTPS traffic only"
  default     = true
}

variable "create_containers" {
  type        = bool
  description = "Create containers in the storage account"
  default     = false
}

variable "containers" {
  type        = string
  description = "JSON string containing container configurations"
  default     = "[]"
} 