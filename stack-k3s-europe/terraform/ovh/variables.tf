# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# OVH
variable "ovh_cred" {
  description = "The OVH account where to deploy the infrastructure."
}

variable "ovh_region" {
  description = "The OVH region where to deploy the infrastructure."
  default     = "SBG1"
}

# Cycloid
variable "cycloid_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cyorg_jwt" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}
