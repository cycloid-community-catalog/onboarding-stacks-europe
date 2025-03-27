# Cycloid
variable "cy_org" {}
variable "cy_project" {}
variable "cy_env" {}
variable "cy_component" {}

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
    cy_organization = var.cy_org
    cy_projectject      = var.cy_project
    cy_environment  = var.cy_env
    cy_component    = var.cy_component
  }
  merged_tags = merge(local.cycloid_tags, var.extra_tags)
}