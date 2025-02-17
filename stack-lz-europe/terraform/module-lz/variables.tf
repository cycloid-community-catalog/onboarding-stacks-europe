# Cycloid
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

variable "ovh_project_id" {
  description = "The OVH Openstack project ID where to deploy the infrastructure."
}

variable "ovh_tenant_id" {
  description = "The OVH Openstack tenant ID where to deploy the infrastructure."
}

variable "ovh_regions" {
  description = "The OVH regions where to deploy the infrastructure."
  default     = ["SBG1"]
}

variable "ionos_regions" {
  description = "The IONOS regions where to deploy the infrastructure."
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