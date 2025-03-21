# Cycloid variables
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

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
