# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# Outscale
variable "outscale_cred" {
  description = "The Outscale account where to deploy the infrastructure."
}

variable "outscale_region" {
  description = "The Outscale region where to deploy the infrastructure."
  default = "eu-west-2"
}

# IONOS
variable "ionos_cred" {
  description = "The IONOS account where to deploy the infrastructure."
}

variable "ionos_region" {
  description = "The IONOS region where to deploy the infrastructure."
  default     = "de/fra"
}