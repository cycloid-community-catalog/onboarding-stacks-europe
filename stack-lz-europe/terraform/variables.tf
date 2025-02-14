# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# OVH
variable "ovh_cred" {
  description = "The OVH account where to deploy the infrastructure."
}

variable "ovh_regions" {
  description = "The OVH regions where to deploy the infrastructure."
  default     = "SBG1"
}

# IONOS
variable "ionos_cred" {
  description = "The IONOS account where to deploy the infrastructure."
}

variable "ionos_regions" {
  description = "The IONOS regions where to deploy the infrastructure."
  default     = "de/fra"
}