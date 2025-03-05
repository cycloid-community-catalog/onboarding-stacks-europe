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
}

# Cycloid
variable "cycloid_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cycloid_api_key" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}
