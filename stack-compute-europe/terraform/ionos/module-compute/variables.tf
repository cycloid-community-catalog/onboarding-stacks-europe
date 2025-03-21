# Cycloid
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

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

variable "ionos_private_network" {
  description = "Whether to connect the instance to a IONOS private network."
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
    cycloid_organization = var.cyorg
    cycloid_project      = var.cypro
    cycloid_environment  = var.cyenv
    cycloid_component    = var.cycom
  }
  merged_tags = merge(local.cycloid_tags, var.extra_tags)
}