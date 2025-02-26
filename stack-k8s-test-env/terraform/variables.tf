# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

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
