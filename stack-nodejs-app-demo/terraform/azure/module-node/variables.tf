# Cycloid
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

variable "git_app_url" {
  description = "Public git URL of the web application to build and deploy."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the existing resource group where the resources will be deployed."
  default     = ""
}

variable "azure_location" {
  description = "Azure location"
  default = "West Europe"
}

variable "vnet_name" {
  description = "VPC name where to deploy the instance"
  default = "default"
}

variable "vm_instance_type" {
  description = "Instance type to deploy."
  default     = "Standard_DS2_v2"
}

variable "vm_disk_size" {
  description = "Disk size for the instance (Go)"
  default = "30"
}

variable "vm_os_user" {
  description = "Admin username to connect to instance via SSH. 'admin' is not allowed by Azure."
  default     = "cycloid"
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  standard_tags = {
    "cycloid.io" = "true"
    cy_env        = var.cy_env
    cy_project    = var.cy_project
    cy_org        = var.cy_org
    demo         = true
    monitoring_discovery = false
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}

