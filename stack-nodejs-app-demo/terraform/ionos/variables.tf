# Cycloid variables
variable "cyorg" {}
variable "cypro" {}
variable "cyenv" {}
variable "cycom" {}

# IONOS
variable "ionos_cred" {
  description = "The IONOS account where to deploy the infrastructure."
}

variable "ionos_region" {
  description = "The IONOS region where to deploy the infrastructure."
  default     = "de/fra"
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
