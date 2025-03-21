# Cycloid
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

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
    cycloid_organization = var.cyorg
    cycloid_project      = var.cypro
    cycloid_environment  = var.cyenv
    cycloid_component    = var.cycom
  }
  merged_tags = merge(local.cycloid_tags, var.extra_tags)
}