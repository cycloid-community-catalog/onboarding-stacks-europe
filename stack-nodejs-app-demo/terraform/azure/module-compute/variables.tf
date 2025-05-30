# Cycloid
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

# Infra
variable "vm_instance_type" {
  description = "Instance type to deploy."
  default     = "Standard_DS2_v2"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "30"
}

variable "vm_ports_in" {
  description = "Ingress TCP ports allowed from the internet.)"
  default = ["80", "443"]
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH. 'admin' is not allowed by Azure."
  default     = "cycloid"
}

variable "res_selector" {
  description = "Whether to create a new VPC or select an existing one"
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

variable "database_enabled" {
  description = "Does you application needs a database?"
}

variable "database_env_var_name" {
  description = "Database Connection String Environment Var Name"
}

variable "database_resource" {
  description = "The Azure managed database that your application will connect to. Blank if there is no database to integrate."
}