# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

variable "outscale_region" {
  description = "The Outscale region where to deploy the infrastructure."
  default = ["eu-west-2"]
}

variable "ionos_region" {
  description = "The IONOS region where to deploy the infrastructure."
  default = ["de/fra"]
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