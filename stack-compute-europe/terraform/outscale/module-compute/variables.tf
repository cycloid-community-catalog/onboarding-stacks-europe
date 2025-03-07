# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# Outscale
variable "outscale_region" {
  description = "The Outscale region where to deploy the infrastructure."
}

variable "outscale_username" {
  description = "The Outscale admin username on the instance."
  default = "outscale"
}

variable "outscale_cpu_gen" {
  description = "The Outscale CPU Generation to deploy."
  default = "6"
}

variable "outscale_cpu" {
  description = "The number of CPU to deploy."
}

variable "outscale_mem" {
  description = "The amount of memory to deploy."
}

variable "outscale_net" {
  description = "The network where to deploy the infrastructure."
}

variable "outscale_private_network" {
  description = "Whether to connect to an Outscale private network."
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