# Cycloid variables
variable "cy_env" {}
variable "cy_project" {}
variable "cy_org" {}

# GCP variables
variable "gcp_project" {}
variable "gcp_region" {
  description = "GCP region where to create servers."
  default     = "europe-west1"
}
variable "gcp_zone" {
  description = "GCP zone where to create servers."
  default     = "europe-west1-b"
}

variable "cy_api_url" {
  type        = string
  description = "Cycloid API endpoint"
}

variable "cy_api_key" {
  type        = string
  description = "Org JWT used for authentication"
  sensitive   = true
}