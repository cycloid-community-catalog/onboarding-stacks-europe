# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# IONOS
variable "ionos_region" {
  description = "The IONOS region where to deploy the infrastructure."
}

variable "ionos_cube" {
  description = "The IONOS cube configuration to deploy."
}

variable "ionos_lan" {
  description = "The network where to deploy the infrastructure."
}

variable "ionos_username" {
  description = "The IONOS admin username on the instance."
  default = "root"
}

# Tags
variable "extra_tags" {
  default = {}
}

locals {
  cycloid_tags = {
    cycloid_organization = var.cy_org
    cycloid_project      = var.cy_pro
    cycloid_environment  = var.cy_env
    cycloid_component    = var.cy_com
  }
  merged_tags = merge(local.cycloid_tags, var.extra_tags)
}