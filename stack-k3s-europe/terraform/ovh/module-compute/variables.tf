# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# OVH
variable "ovh_region" {
  description = "The OVH region where to deploy the infrastructure."
}

variable "ovh_flavor_name" {
  description = "The OVH compute flavor to deploy."
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